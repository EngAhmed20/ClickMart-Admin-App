
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/constant/app_string.dart';
import '../core/functions/default_dialog.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';
import '../data/model/user_model.dart';
import '../data/remote/login_data.dart';

abstract class LoginController extends GetxController{
  login(String email ,String password);
  toggleToSignUp();
  toggleToForgetPass();
  changeVisablity();
  toggleToHome();

}
class LoginControllerImpl extends LoginController{
  late TextEditingController emailController;
  late TextEditingController passwordController ;
  GlobalKey <FormState>key=GlobalKey();
  MyServices myServices=Get.find();
  LoginData loginData=LoginData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  late AdminModel adminModel;
  @override
  login(String email,String password) async{
    statusRequest=StatusRequest.loading;
    update();
   var response= await loginData.loginData(email, password);
   statusRequest =handlingData(response);
   if(StatusRequest.success==statusRequest){
     if(response['status']=="success"){
      adminModel= AdminModel.fromJson(response['data']);
      myServices.sharedPreferences.setString(userId, adminModel.adminId.toString());
      toggleToHome();

     }else{
       defaultDialog("Error", "email address or password is incorrect");
   }
     
   }
   update();
  }
  bool isHidePass=false;
  IconData sufIcon= Icons.lock_open_outlined;
  void changeVisablity(){
    isHidePass=!isHidePass;
    sufIcon=isHidePass?Icons.lock_outline:Icons.lock_open_outlined;
    update();

  }

  @override
  toggleToSignUp() {
    Get.toNamed('/signup');
  }
  toggleToHome()async{
   await myServices.sharedPreferences.setBool('root_home', true);
   Get.offNamed('/root_home',arguments:{
      'userdata':adminModel
    });

  }

  @override
  toggleToForgetPass() {
    Get.toNamed('/forgetPass');
  }
  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }

}