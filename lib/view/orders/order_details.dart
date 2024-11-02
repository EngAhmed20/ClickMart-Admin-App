import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/orders/order_details_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../../core/constant/app_string.dart';
import '../../core/functions/translate_database.dart';
import '../../core/shared/app_style.dart';
class OrderDetailsScr extends StatelessWidget {
  const OrderDetailsScr({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'order details'.tr,
          style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        leading:IconButton(onPressed:(){
          Get.back();
        },icon: Icon(Icons.arrow_back_ios,color: AppColors.primaryColor,size: 30),) ,

      ),
        body: GetBuilder<OrderDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Table(
                    children: [
                      TableRow(children: [
                        Text(
                          'product'.tr,
                          style: textStyle.Bold20.copyWith(
                              color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'quantity'.tr,
                          style: textStyle.Bold20.copyWith(
                              color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'price'.tr,
                          style: textStyle.Bold20.copyWith(
                              color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      ...List.generate(
                        controller.data.length,
                            (index) => TableRow(children: [
                          Text(
                            translateDataBase(controller.data[index].itemsNameAr,controller.data[index].itemsName),
                            style: textStyle.semiBold20,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${controller.data[index].countitems}',
                            style: textStyle.semiBold20,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${controller.data[index].itemsprice}',
                            style: textStyle.semiBold20,
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'total price'.tr,
                        style: textStyle.Bold20.copyWith(
                            color: AppColors.primaryColor),
                      ),
                      Text(
                        ': ${controller.orderModel.ordersTotalprice}\$',
                        style: textStyle.Bold22,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GetBuilder<OrderDetailsController>(
                      builder: (controller) => ListTile(
                        title: Text('shipping address'.tr,
                            style: textStyle.Bold20.copyWith(
                                color: AppColors.primaryColor)),
                        subtitle:
                             Text(
                            '${controller.data[0].addressCity}-${controller.data[0].addressStreet}-${controller.data[0].addressName}',
                            style: textStyle.semiBold18)

                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
