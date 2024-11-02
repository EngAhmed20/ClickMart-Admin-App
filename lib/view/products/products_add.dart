import 'package:dartz/dartz.dart';
import 'package:ecommerce_admin/controller/categories/add_controller.dart';
import 'package:ecommerce_admin/controller/products/add_controller.dart';
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

class AddProducts extends StatelessWidget {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductsController controller = Get.put(AddProductsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add product'.tr,
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
      body: GetBuilder<AddProductsController>(
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
                            valid: (val) {
                              return validInput(val!, 3, 40, "product");
                            },
                            controller: controller.englishNameController,
                            keyboardType: TextInputType.text),
                        const SizedBox(
                          height: 10,
                        ),
                        SharedTextFormFiled(
                            hintText: 'product name ar',
                            controller: controller.arabicNameController,
                            valid: (val) {
                              return validInput(val!, 3, 40, "category");
                            },
                            keyboardType: TextInputType.text),
                        const SizedBox(
                          height: 10,
                        ),
                        SharedTextFormFiled(
                            hintText: 'product price',
                            controller: controller.priceController,
                            valid: (val) {
                              return validInput(val!, 1, 20, "product");
                            },
                            keyboardType: TextInputType.number),
                        const SizedBox(
                          height: 10,
                        ),
                        SharedTextFormFiled(
                            hintText: 'product description en',
                            maxLines: 4,
                            controller: controller.englishDescriptionController,
                            valid: (val) {
                              return validInput(val!, 10, 250, "product");
                            },
                            keyboardType: TextInputType.text),
                        const SizedBox(
                          height: 10,
                        ),
                        SharedTextFormFiled(
                            hintText: 'product description ar',
                            controller: controller.arabicDescriptionController,
                            maxLines: 4,
                            valid: (val) {
                              return validInput(val!, 10, 250, "product");
                            },
                            keyboardType: TextInputType.text),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SharedTextFormFiled(
                                  hintText: 'product quantity',
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
                                  valid: (val) {
                                    return validInput(val!, 1, 5, "product");
                                  },
                                  controller: controller.itemDiscountController,
                                  keyboardType: TextInputType.number),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            DropDownMenu(
                              hintText: 'items rating',
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
                            const SizedBox(width: 20,),
                            Expanded(
                              child: CategoryDropDown(
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                          height: 10,
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
                          text: 'save product'.tr,
                          isLoading:
                              controller.statusRequest == StatusRequest.loading,
                          onPressed: () {
                            controller.changeAutoValidate();
                            if (controller.key.currentState!.validate()) {
                              controller.addProduct();
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
