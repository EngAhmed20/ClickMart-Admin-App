import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_string.dart';
import 'app_style.dart';

class SharedTextFormFiled extends StatelessWidget {
  const SharedTextFormFiled({super.key, required this.hintText, required this.controller, required this.keyboardType, this.valid, this.maxLines=1, this.labelText});
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? valid;
  final String? labelText;
  final int?maxLines;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: valid,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration:InputDecoration(
        hintText: '${hintText}'.tr,
        labelText:labelText,
        hintStyle: textStyle.semiBold14.copyWith(color: Colors.grey[600]),
       focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomRight:Radius.circular(20)),
            borderSide: BorderSide(
                color: AppColors.primaryColor
            )
        ),
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.black38
            )
        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.black38
            )
        ),

      ),

    );

  }
}
