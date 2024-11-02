import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';
import '../../home/widget/order_info.dart';

class HomeOrderCard extends StatelessWidget {
  const HomeOrderCard({super.key, this.viewDetails,this.showButton=true, required this.orderNumber, required this.deliveryMethod, required this.paymentMethod, required this.orderPrice, required this.deliveryPrice, required this.totalPrice, required this.orderStatus, required this.date, required this.acceptOrder, this.orderText, this.showIt=true});
  final void Function()? viewDetails;
  final String orderNumber;
  final String deliveryMethod;
  final String paymentMethod;
  final String orderPrice;
  final String deliveryPrice;
  final String totalPrice;
  final bool? showButton;
  final String orderStatus;
  final bool?showIt;
  final String date;
  final String? orderText;
  final void Function()? acceptOrder;



  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.only(left:10,right: 10,top: 20,bottom: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.thirdColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          mainAxisSize:  MainAxisSize.max,
          children: [
            pendingOrderNumAndDate(label: 'order number',text: orderNumber, date: date,),
            const SizedBox(height: 30,),
            pendingOrderInfo(label: 'order delivery method', text: deliveryMethod),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'order payment method'.tr, text: paymentMethod),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'order price', text: '${orderPrice}\$', ),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'delivery price', text: '${deliveryPrice}\$', ),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'total price', text: '${totalPrice}\$', ),
            const SizedBox(height: 15,),
            /* pendingOrderInfo(label: 'order status', text: orderStatus, ),
            const SizedBox(height: 15,),*/
            showButton==true?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(onPressed: viewDetails,child:  Text('order details'.tr,style: textStyle.semiBold18.copyWith(color: Colors.black),),color: AppColors.primaryColor,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: AppColors.thirdColor),
                ),padding: const EdgeInsets.all(10.0),),
                showIt==true?
                MaterialButton(onPressed: acceptOrder,child:  Text(orderText??'deliver order'.tr,style: textStyle.semiBold18.copyWith(color: Colors.white),),color: Colors.red,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: AppColors.thirdColor),
                ),padding: const EdgeInsets.all(10.0),):Container(),


              ],
            ):Container(height: 1,),






          ],
        ),
      ),
    );
  }
}
