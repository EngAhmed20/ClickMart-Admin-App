import 'package:ecommerce_admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../constant/app_string.dart';
class LocalController extends GetxController{
  MyServices myServices=Get.find();
  Locale?initial;
  changeLocal(String lang){
    Locale locale=Locale(lang);
    myServices.sharedPreferences.setString('lang',lang);
    Jiffy.setLocale(lang);
    Get.updateLocale(locale);
    goToLoginPage();}
    List<String>language=<String>[];
    goToLoginPage(){
    myServices.sharedPreferences.setString(boardingShow, 'skip');
    Get.offNamed('/login');
  }
  changeLangInsideApp(String appLang){
   if(appLang=='en'.tr){
     Locale locale=Locale('en');
     language=<String>['ar'];
     myServices.sharedPreferences.setString('lang','en');
      Jiffy.setLocale('en');
     Get.updateLocale(locale);
   }else{
     Locale locale=Locale('ar');
     language=<String>['en'];
     myServices.sharedPreferences.setString('lang','ar');
     Jiffy.setLocale('ar');
     Get.updateLocale(locale);
   }
    update();

    }
  @override
  void onInit() {
     if (myServices.sharedPreferences.getString('lang') == 'ar') {
       initial = Locale('ar');
       Jiffy.setLocale('ar');
     } else if (myServices.sharedPreferences.getString('lang') == 'en') {
       initial = Locale('en');
       Jiffy.setLocale('en');
     } else {
       initial = Get.deviceLocale;
      // Jiffy.setLocale(Get.deviceLocale.toString());

     }
     if(initial== Locale('ar')){
       language=<String>['en'];

     }else{
       language=<String>['ar'];


     }
  }
}

