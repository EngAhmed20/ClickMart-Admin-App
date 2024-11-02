import 'package:flutter/material.dart';

import '../../../core/shared/app_style.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.label,  this.suffixIcon, required this.controller, this.onPressed, required this.hint,
    this.keyboardType, required this.valid,  this.isPass=false});
  final String label;
  final IconData? suffixIcon;
  final bool isPass;
  final TextEditingController controller;
  final void Function()? onPressed;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? valid;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType:keyboardType,
       obscureText: isPass ,
      validator: valid,
      decoration: InputDecoration(
        label: Text(
         label,style: textStyle.semiBold18,
        ),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: onPressed,icon:Icon(suffixIcon),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
