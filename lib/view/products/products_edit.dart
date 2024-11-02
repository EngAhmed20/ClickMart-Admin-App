import 'package:dartz/dartz.dart';
import 'package:ecommerce_admin/controller/categories/add_controller.dart';
import 'package:ecommerce_admin/controller/products/add_controller.dart';
import 'package:ecommerce_admin/controller/products/edit_controller.dart';
import 'package:ecommerce_admin/core/class/status_request.dart';
import 'package:ecommerce_admin/core/shared/text_form_filed.dart';
import 'package:ecommerce_admin/view/auth/widget/custom_button.dart';
import 'package:ecommerce_admin/view/products/widget/category_drop_down.dart';
import 'package:ecommerce_admin/view/products/widget/drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constant/app_string.dart';
import '../../core/functions/valid_input.dart';
import '../../core/shared/app_style.dart';
import '../../core/shared/button.dart';

class EditProducts extends StatelessWidget {
  const EditProducts({super.key});

  @override
  Widget build(BuildContext context) {
    EditProductController controller = Get.put(EditProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'edit product'.tr,
          style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: GetBuilder<EditProductController>(
          builder: (controller) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: controller.key,
                autovalidateMode: controller.autovalidateMode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SharedTextFormFiled(
                        hintText: 'product name en',
                        labelText: 'product name en'.tr,
                        valid: (val) {
                          return validInput(val!, 3, 40, "product");
                        },
                        controller: controller.englishNameController,
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 15,
                    ),
                    SharedTextFormFiled(
                        hintText: 'product name ar',
                        labelText: 'product name ar'.tr,

                        controller: controller.arabicNameController,
                        valid: (val) {
                          return validInput(val!, 3, 40, "category");
                        },
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 15,
                    ),
                    SharedTextFormFiled(
                        hintText: 'product price',
                        labelText: 'product price'.tr,
                        controller: controller.priceController,
                        valid: (val) {
                          return validInput(val!, 1, 20, "product");
                        },
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 15,
                    ),
                    SharedTextFormFiled(
                        hintText: 'product description en',
                        labelText: 'product description en'.tr,

                        maxLines: 4,
                        controller: controller.englishDescriptionController,
                        valid: (val) {
                          return validInput(val!, 10, 250, "product");
                        },
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 15,
                    ),
                    SharedTextFormFiled(
                        hintText: 'product description ar',
                        labelText: 'product description ar'.tr,
                        controller: controller.arabicDescriptionController,
                        maxLines: 4,
                        valid: (val) {
                          return validInput(val!, 10, 250, "product");
                        },
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SharedTextFormFiled(
                              hintText: 'product quantity',
                              labelText: 'product quantity'.tr,
                              valid: (val) {
                                return validInput(val!, 1, 5, "product");
                              },
                              controller: controller.quantityController,
                              keyboardType: TextInputType.number),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SharedTextFormFiled(
                              hintText: 'product discount',
                              labelText: 'product discount'.tr,
                              valid: (val) {
                                return validInput(val!, 1, 5, "product");
                              },
                              controller: controller.itemDiscountController,
                              keyboardType: TextInputType.number),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('items rating'.tr,style: textStyle.semiBold14,
                                ),
                            const SizedBox(height: 6,),
                            DropDownMenu(
                              hintText: 'items rating',
                              initialSelection: controller.itemRating,
                              onSelected: (String? value) {
                                controller.changeRate(value!);
                              },
                              dropdownMenuEntries: controller.itemRatingList
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                    return DropdownMenuEntry(
                                        value: value.tr, label: value.tr);
                                  }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text('product category'.tr,style: textStyle.semiBold14,
                              ),
                              const SizedBox(height: 6,),
                              CategoryDropDown(
                                text: 'product category'.tr,
                                value: controller.categoryId,
                                onChanged: (int? catId) {
                                  controller.chooseCategoryId(catId!);
                                  print(controller.categoryId);
                                },
                                items: controller.itemsCategoriesList
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  String name = entry.value;
                                  int id = controller.itemsCategoriesId[index];

                                  return DropdownMenuItem<int>(
                                    value: id, // Set the value as ID
                                    child: Text(name), // Display name
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CategoryDropDown(
                      text: 'product status'.tr,
                      value: controller.productStatus,
                      onChanged: (int? statusId) {
                        controller.chooseProductStatus(statusId!);
                        print(controller.productStatus);
                      },
                      items: controller.productStatusList
                          .asMap()
                          .entries
                          .map((entry) {
                        int index = entry.key;
                        String name = entry.value;
                        int id = controller.productStatusId[index];

                        return DropdownMenuItem<int>(
                          value: id, // Set the value as ID
                          child: Text(name), // Display name
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        await controller.chooseProductImg();
                      },
                      label: Text(
                        'add product image'.tr,
                        style: textStyle.semiBold18,
                      ),
                      icon: const Icon(
                        Icons.image_outlined,
                        color: AppColors.thirdColor,
                      ),
                      iconAlignment: IconAlignment.end,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Rounded corners
                            side: const BorderSide(
                                color: AppColors.thirdColor,
                                width: 2), // Optional border
                          ),
                        ),
                      ),
                    ),
                    if (controller.file != null)
                      Image.file(
                        controller.file!,
                        height: 80,
                      ),
                    const SizedBox(
                      height: 40,
                    ),
                    SharedButton(
                      text: 'save changed'.tr,
                      isLoading:
                      controller.statusRequest == StatusRequest.loading,
                      onPressed: () {
                        controller.changeAutoValidate();
                        if (controller.key.currentState!.validate()) {
                          controller.editProduct();
                        }
                      },
                      textStyle:
                      textStyle.Bold22.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}