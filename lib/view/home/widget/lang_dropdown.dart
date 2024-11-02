import 'package:ecommerce_admin/core/shared/app_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/change_local.dart';

class DropDownLang extends GetView<LocalController> {
  const DropDownLang({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller=Get.find();
    return Center(
      child: DropdownMenu<String>(
        width: MediaQuery.of(context).size.width * 0.47,
        initialSelection:controller.language.last,
        hintText: 'chang language'.tr,
        textStyle: textStyle.Bold16,
        inputDecorationTheme: InputDecorationTheme(
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(5)
          )
        ),
        onSelected: (String?value){
          if (kDebugMode) {
            print(value!);
          }
          controller.changeLangInsideApp(value!);
        },
        dropdownMenuEntries:controller.language.map<DropdownMenuEntry<String>>((String value){
          return DropdownMenuEntry(value: value.tr, label: value.tr);
        }).toList(),
      ),
    );
  }
}
