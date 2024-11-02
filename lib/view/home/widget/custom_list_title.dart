import 'package:flutter/material.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({super.key, required this.text,  this.icon,required this.onTap, this.leading});
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  final Widget? leading;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 10,
      leading:leading??  Icon(icon,size: 30,color:Colors.white,),
      title: Text(text,style: textStyle.semiBold20,),
      onTap:onTap,
    );

  }
}