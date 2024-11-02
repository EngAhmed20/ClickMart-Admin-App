import 'package:ecommerce_admin/core/constant/app_string.dart';
import 'package:ecommerce_admin/core/shared/app_style.dart';
import 'package:ecommerce_admin/view/orders/scr/deliverd_orders.dart';
import 'package:ecommerce_admin/view/orders/scr/orders_on_way.dart';
import 'package:ecommerce_admin/view/orders/scr/orders_under_approval.dart';
import 'package:ecommerce_admin/view/orders/scr/orders_under_preparation.dart';
import 'package:ecommerce_admin/view/orders/scr/orders_waiting_shipment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('orders status'.tr,style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),),
          leading: IconButton(icon:Icon( Icons.arrow_back_ios),onPressed: (){
            Get.back();
          },),
          bottom: TabBar(
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 1),
            labelStyle: textStyle.semiBold16,
            labelColor: AppColors.primaryColor,
            indicatorColor: AppColors.thirdColor,
            tabs: [
              Tab(text: 'orders under approval'.tr, icon: Icon(Icons.check_circle_outline_outlined)),
              Tab(text: 'orders under preparation'.tr, icon: Icon(Icons.hourglass_empty)),
              Tab(text: 'orders awaiting shipment'.tr, icon: Icon(Icons.local_shipping)),
              Tab(text: 'orders on the way'.tr, icon: Icon(Icons.directions_car)),
              Tab(text: 'delivered orders'.tr, icon: Icon(Icons.check_circle)),

            ],
          ),
        ),
        body:TabBarView(
          children: [
            OrdersUnderApproval(),
            OrdersUnderPreparation(),
            OrdersWaitingShipment(),
            OrdersOnWay(),
            DeliverdOrders(),
          ],
        ) ,
      ),
    );
  }
}
