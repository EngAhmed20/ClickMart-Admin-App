import 'package:flutter/material.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key,required this.onPressed, required this.text, required this.active, required this.bottmImg});
  final void Function()? onPressed;
  final String text;
  final bool? active;
  final String bottmImg;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Icon(icon,size: 35,color: active==true?AppColors.primaryColor:Colors.grey[600],),
          Image.asset(bottmImg,height: 40,color: active==true?AppColors.primaryColor:Colors.grey[600],),

          Text(text,style: textStyle.Bold16.copyWith(color:active==true?AppColors.primaryColor:Colors.grey[600],fontFamily: "playFair")),

        ],
      ),);
    ;
  }
}
