import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/app_style.dart';

void defaultDialog(String title,String middleText) {
  Get.defaultDialog(title: title,middleText: middleText,titleStyle:textStyle.Bold19.copyWith(color: Colors.red),
      middleTextStyle: textStyle.semiBold16);
}