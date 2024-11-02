import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';

class pendingOrderNumAndDate extends StatelessWidget {
  const pendingOrderNumAndDate({
    super.key, required this.label, required this.text, this.style,  this.mainAxisAlignment=MainAxisAlignment.start, required this.date,
  });
  final String label;
  final String text;
  final String date;
  final TextStyle? style;
  final MainAxisAlignment mainAxisAlignment;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(label.tr,style: style?? textStyle.Bold20,),
        Text(' :'.tr,style: style??textStyle.Bold20,),
        const SizedBox(width: 10,),
        Text(text,style:style?? textStyle.Bold20.copyWith(color: AppColors.primaryColor)),
        const Spacer(),
        Text(Jiffy.parse(date).fromNow(),style:style?? textStyle.Bold20.copyWith(color: AppColors.primaryColor)),

      ],
    );
  }
}
class pendingOrderInfo extends StatelessWidget {
  const pendingOrderInfo({
    super.key, required this.label, required this.text, this.style,  this.mainAxisAlignment=MainAxisAlignment.start,
  });
  final String label;
  final String text;
  final TextStyle? style;
  final MainAxisAlignment mainAxisAlignment;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text('${label}'.tr,style: style?? textStyle.Bold20,),
        Text(' :'.tr,style: style??textStyle.Bold20,),

        const SizedBox(width: 10,),
        Expanded(flex: 1,
            child: Text(text,style:style?? textStyle.Bold20.copyWith(color: AppColors.primaryColor)))
      ],
    );
  }
}