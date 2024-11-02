import 'package:ecommerce_admin/view/auth/widget/custom_button.dart';
import 'package:ecommerce_admin/view/auth/widget/custom_login_icon.dart';
import 'package:ecommerce_admin/view/auth/widget/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../../core/constant/app_string.dart';
import '../../core/functions/alert_exit.dart';
import '../../core/functions/valid_input.dart';
import '../../core/shared/app_style.dart';
import '../../generated/assets.dart';

class LoginScr extends StatelessWidget {
  LoginScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title:  Text(
            'Sign In'.tr,
            style: textStyle.Bold24,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: WillPopScope(onWillPop:alertExitApp,child:GetBuilder<LoginControllerImpl>(
            builder: (controller)=> HandlingDataView(statusRequest: controller.statusRequest!, widget: Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: controller.key,
                child: ListView(
                  children: [
                    Image.asset(
                      Assets.imagesLogo,
                      height: 120,
                    ),
                    Text(
                      'Welcome Back'.tr,
                      style: textStyle.Bold22,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                            'signin body'.tr,
                            textAlign: TextAlign.center,
                            style: textStyle.semiBold16
                                .copyWith(color: Colors.grey[700]))),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextForm(
                        label: 'email'.tr,
                        valid: (val){
                          return validInput(val!,5,100,"email");
                        },
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icons.email_outlined,
                        controller: controller.emailController,
                        hint: 'enter email'.tr),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<LoginControllerImpl>(builder:(controller)=>CustomTextForm(
                        label: 'password'.tr,
                        valid: (val){
                          return validInput(val!,6,20,"password");
                        },
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: controller.sufIcon,
                        onPressed: controller.changeVisablity,
                        isPass: controller.isHidePass,
                        controller: controller.passwordController,
                        hint: 'enter password'.tr),),
                    const SizedBox(
                      height: 10,
                    ),
                    Transform.translate(
                      offset: Offset(-6, 0),
                      child: InkWell(
                          onTap: () {
                            controller.toggleToForgetPass();
                          },
                          child: Text(
                            'forgot password'.tr,
                            style: textStyle.semiBold16.copyWith(color: Colors.red),
                            textAlign: TextAlign.end,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Sign In'.tr,
                      textStyle: textStyle.Bold22.copyWith(color: Colors.white),
                      onPressed: () {
                        if(controller.key.currentState!.validate()){
                          controller.login(controller.emailController.text,controller.passwordController.text);
                        }

                      },
                    ),

                  ],
                ),
              ),
            ),)
        ),)
    );
  }
}
