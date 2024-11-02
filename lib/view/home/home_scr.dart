import 'package:ecommerce_admin/controller/home_controller.dart';
import 'package:ecommerce_admin/core/constant/app_string.dart';
import 'package:ecommerce_admin/core/shared/app_style.dart';
import 'package:ecommerce_admin/view/home/widget/admin_card.dart';
import 'package:ecommerce_admin/view/home/widget/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';

class HomeScr extends StatelessWidget {
  const HomeScr({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController=Get.put(HomeController());
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('dashboard'.tr,style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          _scaffoldKey.currentState?.openEndDrawer();
        }, icon: const Icon(Icons.menu,size: 35,color: AppColors.primaryColor,))],
      ),
        endDrawer:homeDrawer(),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            GridView(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 190,childAspectRatio: 1),physics:NeverScrollableScrollPhysics(),shrinkWrap: true,children: [
              HomeCard(img: Assets.imagesUsers, text: 'user',onTap: (){},),
              HomeCard(img: Assets.imagesMsg, text: 'msg',onTap: (){},),
              HomeCard(img: Assets.imagesDeliveryHome, text: 'orders',onTap: (){
                Get.toNamed('/OrdersView');
              },),
              HomeCard(img: Assets.imagesProducts, text: 'product',onTap: (){
                Get.toNamed('/ProductsView');
              },),
              HomeCard(img: Assets.imagesCategories, text: 'categories',onTap: (){
                Get.toNamed('/categoriesview');
              },),




            ],),
          ],
        ),
      )

    );
  }
}

