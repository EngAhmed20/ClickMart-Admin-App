import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app_style.dart';

void defaultDialog(String title,String middleText) {
  Get.defaultDialog(title: title,middleText: middleText,titleStyle:textStyle.Bold19.copyWith(color: Colors.red),
      middleTextStyle: textStyle.semiBold16);
}