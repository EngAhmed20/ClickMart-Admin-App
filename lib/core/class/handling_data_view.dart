
import 'package:ecommerce_admin/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import '../constant/app_string.dart';
import '../shared/app_style.dart';

class  HandlingDataView extends StatelessWidget {
  const  HandlingDataView({super.key, required this.statusRequest, required this.widget, this.faiTextAlign,this.failureText});
  final StatusRequest statusRequest ;
  final Widget widget;
  final Widget?failureText;
  final AlignmentGeometry? faiTextAlign;


  @override
  Widget build(BuildContext context) {
   return
    statusRequest==StatusRequest.loading ?
      Center(child: Lottie.asset(Assets.imagesLoadingAnimation,width: 200,delegates: LottieDelegates(
        values: [
          ValueDelegate.color(
            const ['**'],
            value: AppColors.primaryColor, //// Your desired color here
          ),
        ]
      ))):
    statusRequest==StatusRequest.offlineFailure?
   const  Center(child: Text('No internet connection',style: textStyle.Bold19,)):
    statusRequest==StatusRequest.serverFailure?
     const Center(child: Text('Server error',style: textStyle.Bold19,)):
    statusRequest==StatusRequest.failure?
      Container(
          width: double.infinity,
          height:MediaQuery.of(context).size.height,
          child: Align(alignment:faiTextAlign?? Alignment.center,child:failureText?? Text('error while get data',style: textStyle.Bold19,))):
        widget;




  }
}
