import 'package:ecommerce_admin/core/class/status_request.dart';
import 'package:ecommerce_admin/core/constant/app_string.dart';
import 'package:ecommerce_admin/core/functions/handling_data.dart';
import 'package:ecommerce_admin/core/services/services.dart';
import 'package:ecommerce_admin/data/model/categories_model.dart';
import 'package:ecommerce_admin/data/remote/categorise_data.dart';
import 'package:ecommerce_admin/data/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/add_remove_snack.dart';
import '../../core/shared/app_style.dart';


class CategoriesViewController extends GetxController{
  CategoriseData categoriseViewData=CategoriseData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices=Get.find();
  List <CategoriesModel>categoriesModel=[];
  getHomeData()async{
    categoriesModel.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await categoriseViewData.getData();
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        List homeData=response['data'];
        categoriesModel=homeData.map((data)=>CategoriesModel.fromJson(data)).toList();
        print("sucesss get category");

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  deleteCategory(String id,String imgName)async{
    statusRequest=StatusRequest.loading;
    update();
    Map data={
      'id':id,
      'imgname':imgName,
    };
    var response=await categoriseViewData.removeData(data);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        add_removeSnack('delete category success');
        getHomeData();

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();

  }
  confirmDeleteCategory(String id,String imgName){
    Get.defaultDialog(
      title: 'alert'.tr,titleStyle: textStyle.semiBold18.copyWith(color: AppColors.secondaryColor),
      middleText: 'delete category msg'.tr,middleTextStyle: textStyle.semiBold16,
      onCancel: (){
      },
      textCancel: 'cancle'.tr,
      textConfirm: 'confirm'.tr,
      buttonColor: Colors.red,

      onConfirm: (){
        Get.back();
        deleteCategory(id,imgName);
      },

    );
  }
  @override
  void onInit() async{
    await getHomeData();
    super.onInit();
  }
  goToAddPage(){
   Get.toNamed('/categoriesadd');
  }
  goBack(){
    Get.offAllNamed('/root_home');

  }
  goToEditPage(index){
    Get.toNamed('categoriesedit',arguments: {
      'category Model':categoriesModel[index]
    });
  }
}