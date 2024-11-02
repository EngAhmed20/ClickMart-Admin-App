import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/categories/view_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/functions/translate_database.dart';
import '../../../core/shared/app_style.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.controller, required this.index});
  final CategoriesViewController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child:Card(
        elevation: 5,
        shadowColor: AppColors.primaryColor,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: SvgPicture.network("${AppLinks.categoryImg}${controller.categoriesModel[index].categoriesImage}",height: 80,color: Colors.black,),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: Text(translateDataBase(controller.categoriesModel[index].categoriesNameAr.toString(), controller.categoriesModel[index].categoriesName.toString()),style: textStyle.semiBold20.copyWith(color: AppColors.secondaryColor),),
                  subtitle:Text(Jiffy.parse(controller.categoriesModel[index].categoriesDatetime.toString()).yMMM,style: textStyle.semiBold14,),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
