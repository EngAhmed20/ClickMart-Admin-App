import 'package:ecommerce_admin/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/order_under_approval_controller.dart';
import '../../../core/shared/app_style.dart';
import '../widget/order_card.dart';

class OrdersUnderApproval extends StatelessWidget {
  const OrdersUnderApproval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderUnderApprovalController());
    return GetBuilder<OrderUnderApprovalController>(
      builder: (OrderUnderApprovalController controller) => HandlingDataView(
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
              orderText: 'confirm order'.tr,
              acceptOrder: (){
              controller.approveOrder(controller.orderModel[index].ordersId.toString(),controller.orderModel[index].ordersUsersId.toString());
              },),itemCount: controller.orderModel.length,),
        failureText: Text('no orders'.tr,style: textStyle.semiBold20,)
          )
    );
  }
}
