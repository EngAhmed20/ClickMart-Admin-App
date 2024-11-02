import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant/app_string.dart';
import '../shared/app_style.dart';

void add_removeSnack(String Msg,{IconData? icon,Color? iconColor }) {
  Get.rawSnackbar(
    messageText: Text("${Msg}".tr,style: textStyle.semiBold16.copyWith(color: AppColors.primaryColor),),
    icon: Icon(icon??Icons.check_circle_outline,color:iconColor??Colors.blue,),
    backgroundColor: Colors.white,
    shouldIconPulse: true,
  );
}