
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/app_style.dart';
import '../../../controller/forget_password/reset_pass_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/functions/valid_input.dart';
import 'custom_button.dart';
import 'custom_textform.dart';
class ResetPassScr extends StatelessWidget {
  ResetPassScr({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPassControllerImpl controller = Get.put(ResetPassControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'reset pass'.tr,
          style: textStyle.Bold24,
        ),
        centerTitle: true,
      ),
      body: HandlingDataView(statusRequest: controller.statusRequest!, widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                CustomTextForm(
                    label: 'password'.tr,
                    valid: (val){
                      return validInput(val!,6,20,"password");
                    },
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: Icons.lock_outline,
                    controller: controller.passController,
                    hint: 'your new pass'.tr),
                const SizedBox(
                  height: 25,
                ),
                CustomTextForm(
                    label: 'password',
                    valid: (val){
                      return validInput(val!,6,20,"password");
                    },
                    suffixIcon: Icons.lock_outline,
                    controller: controller.confirmPassController,
                    keyboardType: TextInputType.visiblePassword,
                    hint: 'confirm new pass'.tr),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<ResetPassControllerImpl>(builder:(controller)=>CustomButton(
                  text: 'save'.tr,
                  textStyle: textStyle.Bold22.copyWith(color: Colors.white),
                  onPressed: () {
                    controller.resetPass();
                  },
                )),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),),
    );
  }
}

