import 'package:ecommerce_admin/core/services/services.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController{
  MyServices myServices=Get.find();
  void logout() {
    myServices.sharedPreferences.setBool('home', false);
    Get.offNamed('/login');
    update();

  }
}