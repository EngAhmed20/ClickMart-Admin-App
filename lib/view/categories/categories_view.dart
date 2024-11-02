import 'package:ecommerce_admin/controller/categories/view_controller.dart';
import 'package:ecommerce_admin/core/class/handling_data_view.dart';
import 'package:ecommerce_admin/core/constant/api_link.dart';
import 'package:ecommerce_admin/core/functions/translate_database.dart';
import 'package:ecommerce_admin/view/categories/widget/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../core/constant/app_string.dart';
import '../../core/shared/app_style.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesViewController controller=Get.put(CategoriesViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text('categories'.tr,style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),),
        leading: IconButton(icon:Icon( Icons.arrow_back_ios),onPressed: (){
          controller.goBack();
        },),
        centerTitle: true,
      ),
      body: GetBuilder<CategoriesViewController>(
        builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: WillPopScope(
          onWillPop: (){
            return controller.goBack();
          },
          child: ListView.builder(
              itemCount: controller.categoriesModel.length,
              itemBuilder: (context,index)=>Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Slidable(
                  startActionPane: ActionPane(motion: const StretchMotion(),
                      children: [
                        Expanded(
                          flex: 2,
                          child: IconButton(icon: const Icon(Icons.delete_outline_outlined,size: 45,color: Colors.red,), onPressed: () {
                            controller.confirmDeleteCategory(controller.categoriesModel[index].categoriesId.toString(), controller.categoriesModel[index].categoriesImage.toString());
                          }),
                        ),
                        Expanded(
                          flex: 2,
                          child: IconButton(icon: const Icon(Icons.edit_outlined,size: 45,color:AppColors.primaryColor,), onPressed: () {
                            controller.goToEditPage(index);

                          }),
                        ),
                      ]),
                    child: CategoryCard( controller: controller, index:index,)),
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
