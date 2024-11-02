import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';
import 'custom_button.dart';

class CustomSuccessWidget extends StatelessWidget {
  const CustomSuccessWidget({super.key, this.text});
  final String? text;


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        const SizedBox(
          height: 130,
          width: 130,
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.check_circle_outline,size: 120,color: Colors.blue,),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
         Text(text??'thanks for signup'.tr, style: textStyle.semiBold20,textAlign: TextAlign.center,),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CustomButton(
            text: 'back to login'.tr,
            height: 50,
            width: double.infinity,
            textStyle: textStyle.Bold20.copyWith(color: Colors.white),
            onPressed: () {
              Get.offAllNamed('/login');
            },
          ),
        ),
        const SizedBox(height: 15,),

      ],
    );
  }
}
