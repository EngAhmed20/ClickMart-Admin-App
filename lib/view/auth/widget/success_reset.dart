import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_sucess_widget.dart';

class SuccessResetPass extends StatelessWidget {
  const SuccessResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomSuccessWidget(text: 'change pass'.tr,),
    );

  }
}
