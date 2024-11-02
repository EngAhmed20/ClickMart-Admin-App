import 'package:flutter/material.dart';

import '../../../core/shared/app_style.dart';

class CustomLoginIcon extends StatelessWidget {
   CustomLoginIcon({super.key,required this.onPressed, required this.text,required this.leading});
   void Function()? onPressed;
   final String text;
   Widget? leading;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1),
          )),
          onPressed: onPressed,
          child: ListTile(
            visualDensity: VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            leading: leading,
            title: Text(
              text,
              style: textStyle.semiBold16,
            ),
          )),
    );
  }
}
