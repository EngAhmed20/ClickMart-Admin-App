import 'package:ecommerce_admin/controller/root_home.dart';
import 'package:ecommerce_admin/view/home/home_scr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RootHome extends StatelessWidget {
  const RootHome({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(RootHomeController());
    return GetBuilder<RootHomeController>(builder:(controller)=>Scaffold(
      body: HomeScr(),
    ) );
  }
}
