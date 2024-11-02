import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/app_string.dart';
import '../../generated/assets.dart';



class SharedButton extends StatelessWidget {
  const SharedButton({super.key, required this.text, required this.onPressed, this.textStyle, this.width, this.height, this.isLoading=false, this.backgroundColor});
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
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomLeft:Radius.circular(20)),

              ),
            ),
            onPressed: onPressed, child:isLoading?      Center(child: Lottie.asset(Assets.imagesLoadingAnimation,width: 800,delegates: LottieDelegates(
            values: [
              ValueDelegate.color(
                const ['**'],
                value:Colors.white, //// Your desired color here
              ),
            ]
        ))):
          Text(text,style:textStyle?? TextStyle(color: Colors.white),)));
  }
}