import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/default_dialog.dart';
import '../../core/functions/handling_data.dart';
import '../../data/reset_password/verify_code.dart';


abstract class VerifyCodeController extends GetxController{
  toggleToResetPass();
  checkCode(String code);

}

class VerifyCodeControllerImpl extends VerifyCodeController{
   String? email;
   VerifyCodeResetData verifyCodeResetData=VerifyCodeResetData(Get.find());
   StatusRequest? statusRequest;
  @override
  checkCode(String code) async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await verifyCodeResetData.verifyCodeResetData(email!, code);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest)
      {
        if(response['status']=="success"){
          toggleToResetPass();
        }else{
          defaultDialog('Error','Invalid Code Please Try Again ');
        }

      }else{
      defaultDialog('Error',"Error While Sending Code ");

    }
    update();

  }

  @override
  toggleToResetPass() {
    Get.offNamed('/resetPass',arguments:{
      'email':email!
    });

  }
  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }

}