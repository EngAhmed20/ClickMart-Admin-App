import 'package:ecommerce_admin/controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locale_switcher/locale_switcher.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';
import 'custom_list_title.dart';
import 'lang_dropdown.dart';

class homeDrawer extends StatelessWidget {
  const homeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LogoutController controller=Get.put(LogoutController());
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      backgroundColor:AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            CustomListTitle(text: 'accepted orders'.tr, icon: Icons.shopping_cart,onTap: (){
              Get.toNamed('/accepted');

            }),
            CustomListTitle(text: 'archived orders'.tr, icon: Icons.archive_outlined,onTap: (){
              Get.toNamed('/archive');

            }),
            const SizedBox(height: 10,),
            DropDownLang(),
            const SizedBox(height: 10,),
            CustomListTitle(text: 'logout'.tr, icon: Icons.logout_outlined,onTap: (){
              Get.defaultDialog(
                title: 'alert'.tr,titleStyle: textStyle.semiBold18.copyWith(color: AppColors.secondaryColor),
                middleText: 'logout msg'.tr,middleTextStyle: textStyle.semiBold16,
                onCancel: (){
                },
                textCancel: 'cancle'.tr,
                textConfirm: 'confirm'.tr,
                buttonColor: Colors.red,

                onConfirm: (){
                  controller.logout();
                },

              );
            }),



          ],
        ),
      ),

    );
  }
}
