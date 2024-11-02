import 'package:ecommerce_admin/core/localization/change_local.dart';
import 'package:ecommerce_admin/view/lang/widget/lang_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/shared/app_style.dart';

class LangView extends StatelessWidget {
  const LangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController controller=Get.find();
    return Scaffold(
      body:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('chooseLang'.tr,style:textStyle.Bold23,),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LangButton(onPressed: (){
              controller.changeLocal('ar');
            },text: 'ar'.tr,),
            LangButton(onPressed: (){
              controller.changeLocal('en');
            }, text: 'en'.tr)
          ],
        ),
      ],
    ),

    );
  }
}
