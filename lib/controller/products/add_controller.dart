import 'dart:io';

import 'package:ecommerce_admin/controller/products/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/add_remove_snack.dart';
import '../../core/functions/default_dialog.dart';
import '../../core/functions/handling_data.dart';
import '../../core/functions/upload_file.dart';
import '../../core/services/services.dart';
import '../../data/remote/categorise_data.dart';
import '../../data/remote/items_data.dart';

class AddProductsController extends GetxController{
  late TextEditingController arabicNameController;
  late  TextEditingController englishNameController;
  late  TextEditingController englishDescriptionController;
  late  TextEditingController arabicDescriptionController;
  late  TextEditingController priceController;
  late  TextEditingController quantityController;
  late  TextEditingController itemDiscountController;
  List <String>itemRatingList=[
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  List <String> itemsCategoriesList=[
    'laptop'.tr,
    'camera'.tr,
    'mobile'.tr,
    'shoes'.tr,
    'dress'.tr,
    'headphones'.tr,
    'books'.tr
  ];
  List <int>itemsCategoriesId=[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];
  late GlobalKey <FormState>key;
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  ItemsData itemsData=ItemsData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices=Get.find();
   int? categoryId;
   int? productStatus;
   List<String>productStatusList=[
     'hide'.tr,
     'display'.tr,
     ];
   List<int>productStatusId=[
     0,
     1,
   ];
  chooseCategoryId(int value){
    categoryId=value;
    update();
  }
  chooseProductStatus(int value){
    productStatus=value;
    update();
  }
  changeAutoValidate(){
    autovalidateMode=AutovalidateMode.always;
    update();
  }

  String itemRating='0';
  changeRate(String value){
    itemRating=value;
    print(itemRating);
    update();

  }



  File? file;
  chooseProductImg()async{
    await openCameraOrGallery(openCamera,openGallery);
    update();
  }
  openCamera()async{
    file=await imageUploadCamera();
    update();
  }
  openGallery()async{
    file=await fileUploadGallery();
    update();
  }
  addProduct()async{
    if (file==null||categoryId==null||productStatus==null) {
      defaultDialog('error'.tr, 'error img'.tr);
      update();

    }
    statusRequest=StatusRequest.loading;
    update();
    Map data={
      'items_name':englishNameController.text,
      'items_name_ar':arabicNameController.text,
      'items_desc':englishDescriptionController.text,
      'items_desc_ar':arabicDescriptionController.text,
      'items_price':priceController.text,
      'items_count':quantityController.text,
      'items_active':productStatus.toString(),
      'items_discount':itemDiscountController.text,
      'items_categories':categoryId.toString(),
      'items_rating':itemRating,


    };
    var response=await itemsData.addData(data,file!);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        print("sucesss add  item");
        add_removeSnack('add product success');
        goBack();

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  @override
  void onInit() {
    arabicNameController=TextEditingController();
    englishNameController=TextEditingController();
    arabicDescriptionController=TextEditingController();
    englishDescriptionController=TextEditingController();
    priceController=TextEditingController();
    quantityController=TextEditingController();
    itemDiscountController=TextEditingController();
    key=GlobalKey();
    super.onInit();
  }
  goBack(){
    Future.delayed(const Duration(seconds: 2), () {
      ProductsViewController controller=Get.find();
      controller.getHomeData();
      Get.offNamed('/ProductsView');
    });
  }
}