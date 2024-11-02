import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/orders/order_under_approval_controller.dart';
import '../../../controller/orders/under_prep_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/shared/app_style.dart';
import '../widget/order_card.dart';

class OrdersUnderPreparation extends StatelessWidget {
  const OrdersUnderPreparation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderUnderPrepController());
    return GetBuilder<OrderUnderPrepController>(
        builder: ( controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemBuilder:(context,index)=> HomeOrderCard(orderNumber: '${controller.orderModel[index].ordersId}',
                deliveryMethod: '${controller.orderModel[index].ordersType}',
                viewDetails: (){controller.goToDetails(index);},
                paymentMethod: '${controller.orderModel[index].ordersPaymentmethod}',
                orderPrice: '${controller.orderModel[index].ordersPrice}',
                deliveryPrice: '${controller.orderModel[index].ordersId}',
                totalPrice: '${controller.orderModel[index].ordersTotalprice}',
                orderStatus: '${controller.orderModel[index].ordersId}',
                date: '${controller.orderModel[index].ordersDatetime}',
                orderText: 'prep order'.tr,
                acceptOrder: (){
                  controller.prepOrder(controller.orderModel[index].ordersId.toString(),
                      controller.orderModel[index].ordersUsersId.toString(),
                  controller.orderModel[index].ordersType.toString()
                  );
                },),itemCount: controller.orderModel.length,),
            failureText: Text('no orders'.tr,style: textStyle.semiBold20,)
        )
    );
  }
}
