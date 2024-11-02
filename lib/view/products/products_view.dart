import 'package:ecommerce_admin/controller/categories/view_controller.dart';
import 'package:ecommerce_admin/controller/products/view_controller.dart';
import 'package:ecommerce_admin/core/class/handling_data_view.dart';
import 'package:ecommerce_admin/view/categories/widget/category_card.dart';
import 'package:ecommerce_admin/view/products/widget/products_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../core/constant/app_string.dart';
import '../../core/shared/app_style.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsViewController controller=Get.put(ProductsViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text('products'.tr,style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),),
        leading: IconButton(icon:Icon( Icons.arrow_back_ios),onPressed: (){
          controller.goBack();
        },),
        centerTitle: true,
      ),
      body: GetBuilder<ProductsViewController>(
        builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: WillPopScope(
          onWillPop: (){
            return controller.goBack();
          },
          child: ListView.builder(
              itemCount: controller.itemsModel.length,
              itemBuilder: (context,index)=>Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Slidable(
                  startActionPane: ActionPane(motion: const StretchMotion(),
                      children: [
                        Expanded(
                          flex: 2,
                          child: IconButton(icon: const Icon(Icons.delete_outline_outlined,size: 45,color: Colors.red,), onPressed: () {
                            controller.confirmDeleteItem(controller.itemsModel[index].itemsId.toString(), controller.itemsModel[index].itemsImage.toString());
                          }),
                        ),
                        Expanded(
                          flex: 2,
                          child: IconButton(icon: const Icon(Icons.edit_outlined,size: 45,color:AppColors.primaryColor,), onPressed: () {
                            controller.goToEditPage(index);

                          }),
                        ),
                      ]),
                    child: ProductsCard( controller: controller, index:index,)),
              )),
        )
      )
    ),
      floatingActionButton: FloatingActionButton(
        shape:OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.white),
        ),onPressed: () {
          controller.goToAddPage();
      },backgroundColor: AppColors.primaryColor,child: const Icon(Icons.add,size: 30,color: Colors.white,),),
    );
  }

}
