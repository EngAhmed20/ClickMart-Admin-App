import 'dart:io';
import 'package:ecommerce_admin/controller/categories/view_controller.dart';
import 'package:ecommerce_admin/core/functions/default_dialog.dart';
import 'package:ecommerce_admin/data/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/add_remove_snack.dart';
import '../../core/functions/handling_data.dart';
import '../../core/functions/upload_file.dart';
import '../../core/services/services.dart';
import '../../data/remote/categorise_data.dart';

class EditCategoryController extends GetxController{
  late TextEditingController arabicNameController;
  late  TextEditingController englishNameController;
  late GlobalKey <FormState>key;
  late CategoriesModel categoryModel;
  AutovalidateMode autovalidateMode=AutovalidateMode.always;
  CategoriseData categoriseViewData=CategoriseData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices=Get.find();
  File? file;
  chooseCategoryImg()async{
    file=await fileUploadGallery(true);
    print(file!.path);
    update();
  }
  editCategory()async{
    statusRequest=StatusRequest.loading;
    update();
    print(englishNameController.text);
    Map data={
      'cat_name':englishNameController.text,
      'cat_name_ar':arabicNameController.text,
      'id':categoryModel.categoriesId.toString(),
      'oldimg':categoryModel.categoriesImage,
    };
    var response=await categoriseViewData.editData(data,file);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        add_removeSnack('edit category success');
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
    categoryModel=Get.arguments['category Model'];
    arabicNameController=TextEditingController();
    englishNameController=TextEditingController();
    arabicNameController.text=categoryModel.categoriesNameAr!;
    englishNameController.text=categoryModel.categoriesName!;
    key=GlobalKey();
    super.onInit();
  }
  goBack(){
    Future.delayed(Duration(seconds: 2), () {
      CategoriesViewController controller=Get.find();
      controller.getHomeData();
      Get.offNamed('/categoriesview');
    });
  }
}