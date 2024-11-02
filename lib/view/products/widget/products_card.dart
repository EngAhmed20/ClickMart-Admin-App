import 'package:ecommerce_admin/controller/products/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/categories/view_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/functions/translate_database.dart';
import '../../../core/shared/app_style.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard(
      {super.key, required this.controller, required this.index});
  final ProductsViewController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 5,
        shadowColor: AppColors.primaryColor,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                  "${AppLinks.itemsImg}${controller.itemsModel[index].itemsImage}",
                  height: 100),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                title: Text(
                  translateDataBase(
                      controller.itemsModel[index].itemsNameAr.toString(),
                      controller.itemsModel[index].itemsName.toString()),
                  style: textStyle.semiBold20
                      .copyWith(color: AppColors.secondaryColor),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Jiffy.parse(
                              controller.itemsModel[index].itemsDate.toString())
                          .yMMM,
                      style: textStyle.semiBold14,
                    ),
                    Text("${"available quantity".tr} ${controller.itemsModel[index].itemsCount}")
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "${controller.itemsModel[index].itemsPrice}\$",
                style: textStyle.semiBold18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
