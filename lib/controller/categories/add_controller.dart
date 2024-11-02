import 'dart:io';
import 'package:ecommerce_admin/controller/categories/view_controller.dart';
import 'package:ecommerce_admin/core/functions/default_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/add_remove_snack.dart';
import '../../core/functions/handling_data.dart';
import '../../core/functions/upload_file.dart';
import '../../core/services/services.dart';
import '../../data/remote/categorise_data.dart';

class AddCategoryController extends GetxController{
  late TextEditingController arabicNameController;
 late  TextEditingController englishNameController;


  late GlobalKey <FormState>key;
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
  addCategory()async{
    if (file==null) {
      defaultDialog('error'.tr, 'error img'.tr);
      update();
      
    }  
    statusRequest=StatusRequest.loading;
    update();
    Map data={
      'cat_name':englishNameController.text,
      'cat_name_ar':arabicNameController.text,
    };
    var response=await categoriseViewData.addData(data,file!);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        print("sucesss add  category");
        add_removeSnack('add category success');
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