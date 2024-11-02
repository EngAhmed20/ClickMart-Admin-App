import 'package:ecommerce_admin/core/class/status_request.dart';
import 'package:ecommerce_admin/core/constant/app_string.dart';
import 'package:ecommerce_admin/core/functions/handling_data.dart';
import 'package:ecommerce_admin/core/services/services.dart';
import 'package:ecommerce_admin/data/model/categories_model.dart';
import 'package:ecommerce_admin/data/model/items_model.dart';
import 'package:ecommerce_admin/data/remote/categorise_data.dart';
import 'package:ecommerce_admin/data/remote/home_data.dart';
import 'package:ecommerce_admin/data/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/add_remove_snack.dart';
import '../../core/shared/app_style.dart';


class ProductsViewController extends GetxController{
  ItemsData itemsData=ItemsData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices=Get.find();
  List <ItemsModel>itemsModel=[];
  getHomeData()async{
    itemsModel.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await itemsData.getData();
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        List homeData=response['data'];
        itemsModel=homeData.map((data)=>ItemsModel.fromJson(data)).toList();
        print("sucesss get items");

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  deleteItem(String id,String imgName)async{
    statusRequest=StatusRequest.loading;
    update();
    Map data={
      'id':id,
      'imgname':imgName,
    };
    var response=await itemsData.removeData(data);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        add_removeSnack('delete product success');
        getHomeData();

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();

  }
  confirmDeleteItem(String id,String imgName){
    Get.defaultDialog(
      title: 'alert'.tr,titleStyle: textStyle.semiBold18.copyWith(color: AppColors.secondaryColor),
      middleText: 'delete product msg'.tr,middleTextStyle: textStyle.semiBold16,
      onCancel: (){
      },
      textCancel: 'cancle'.tr,
      textConfirm: 'confirm'.tr,
      buttonColor: Colors.red,

      onConfirm: (){
        Get.back();
        deleteItem(id,imgName);
      },

    );
  }
  @override
  void onInit() async{
    await getHomeData();
    super.onInit();
  }
  goToAddPage(){
    Get.toNamed('/productsadd');
  }
  goBack(){
    Get.offAllNamed('/root_home');

  }
  goToEditPage(index){
    Get.toNamed('/productsedit',arguments: {
      'itemModel':itemsModel[index]
    });
  }
  @override
  void onClose() {
    print("closed");
    super.onClose();
  }
}