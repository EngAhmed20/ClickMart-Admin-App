import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/forget_password/verify_code_controller.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';

class VerifyCodeScr extends StatelessWidget {
  VerifyCodeScr({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImpl controller = Get.put(VerifyCodeControllerImpl());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text(
          'verification title'.tr,
          style: textStyle.Bold24,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height/2,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Text(
                  'check code'.tr,
                  style: textStyle.Bold22,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text('code body'.tr,
                        textAlign: TextAlign.center,
                        style: textStyle.semiBold16
                            .copyWith(color: Colors.grey[700])),
                    Text('${controller.email}',
                        textAlign: TextAlign.center,
                        style: textStyle.semiBold16
                            .copyWith(color: Colors.grey[700])),


                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                OtpTextField(
                  numberOfFields: 5,
                  enabledBorderColor: AppColors.primaryColor,
                  borderColor: Colors.grey,
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(10),
                  onCodeChanged: (String code) {
                  },
                  onSubmit: (String verificationCode){
                    controller.checkCode(verificationCode);
                  }, // end onSubmit
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}


