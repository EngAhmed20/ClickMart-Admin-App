import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/app_style.dart';
import '../../../controller/forget_password/forget_pass_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/functions/valid_input.dart';
import 'custom_button.dart';
import 'custom_textform.dart';
class ForgetPassScr extends StatelessWidget {
  ForgetPassScr({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPassControllerImpl controller = Get.put(ForgetPassControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'find your acc'.tr,
          style: textStyle.Bold24,
        ),
        centerTitle: true,
      ),
      //                  ',
      body: HandlingDataView(statusRequest: controller.statusRequest!,widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height/2,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: controller.key,
              child: ListView(
                children: [
                  Text(
                    'check email'.tr,
                    style: textStyle.Bold22,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                          'verification code'.tr,
                          textAlign: TextAlign.center,
                          style: textStyle.semiBold16
                              .copyWith(color: Colors.grey[700]))),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextForm(
                      label: 'Email',
                      valid: (val){
                        return validInput(val!,5,100,"email");
                      },
                      suffixIcon: Icons.email_outlined,
                      controller: controller.emailController,
                      hint: 'Enter your email'),
                  const SizedBox(
                    height: 25,
                  ),

                  CustomButton(
                    text: 'check'.tr,
                    textStyle: textStyle.Bold22.copyWith(color: Colors.white),
                    onPressed: () {
                      if(controller.key.currentState!.validate())
                      {
                        controller.checkEmail();

                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),),
    );
  }


}
