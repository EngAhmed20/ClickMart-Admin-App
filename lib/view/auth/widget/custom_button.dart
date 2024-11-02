import 'package:flutter/material.dart';

import '../../../core/constant/app_string.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed, this.textStyle, this.width, this.height, this.isLoading=false, this.backgroundColor});
  final String text;
  final VoidCallback onPressed;
  final TextStyle?textStyle;
  final double? width;
  final double? height;
  final bool isLoading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width??double.infinity,
        height: height??54,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor??AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),

              ),
            ),
            onPressed: onPressed, child:isLoading?CircularProgressIndicator(color: Colors.white,):Text(text,style:textStyle?? TextStyle(color: Colors.white),)));
  }
}