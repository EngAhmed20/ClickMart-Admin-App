import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, this.onTap, required this.img, required this.text});
  final void Function()? onTap;
  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor:AppColors.thirdColor,
      child: SizedBox(
        width: 100,
        child: Card(
          elevation: 12,
          shadowColor: AppColors.thirdColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(img,width: 120,),
                const SizedBox(height: 15,),
                Text(text.tr,style: textStyle.Bold24.copyWith(color: AppColors.primaryColor),)

              ],
            ),
          ),
        ),
      ),
    );

  }
}
