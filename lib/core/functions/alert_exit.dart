import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> alertExitApp() async {
  Get.defaultDialog(
    title: 'alert'.tr,
    middleText: 'exit app msg'.tr,
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child:Text('confirm'.tr)),
      ElevatedButton(onPressed: ()=> Get.back(), child: Text('cancel'.tr)),
    ],
  );
  bool x=true;
  return x;
}