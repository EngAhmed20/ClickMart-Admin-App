import 'package:flutter/material.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';


class CustomOrWidget extends StatelessWidget {
  const CustomOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Container(width: double.infinity,height: 1,color:AppColors.primaryColor,)),
      const SizedBox(width: 2,),
      const Text('OR',style: textStyle.semiBold16),
      const SizedBox(width: 2,),
      Expanded(child: Container(width: double.infinity,height: 1,color: AppColors.primaryColor,)),



    ],);

  }
}
