import 'package:ecommerce_admin/controller/categories/add_controller.dart';
import 'package:ecommerce_admin/core/class/status_request.dart';
import 'package:ecommerce_admin/core/shared/text_form_filed.dart';
import 'package:ecommerce_admin/view/auth/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constant/app_string.dart';
import '../../core/functions/valid_input.dart';
import '../../core/shared/app_style.dart';
import '../../core/shared/button.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategoryController controller = Get.put(AddCategoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add categories'.tr,
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
      body: GetBuilder<AddCategoryController>(
          builder: (controller) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: controller.key,
                  autovalidateMode: controller.autovalidateMode,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SharedTextFormFiled(
                          hintText: 'cat name en',
                          valid: (val) {
                            return validInput(val!, 3, 12, "category");
                          },
                          controller: controller.englishNameController,
                          keyboardType: TextInputType.text),
                      const SizedBox(
                        height: 20,
                      ),
                      SharedTextFormFiled(
                          hintText: 'cat name ar',
                          controller: controller.arabicNameController,
                          valid: (val) {
                            return validInput(val!, 3, 12, "category");
                          },
                          keyboardType: TextInputType.text),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          await controller.chooseCategoryImg();
                        },
                        label: Text(
                          'add category image'.tr,
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
                              borderRadius:
                                  BorderRadius.circular(12), // Rounded corners
                              side: const BorderSide(
                                  color: AppColors.thirdColor,
                                  width: 2), // Optional border
                            ),
                          ),
                        ),
                      ),
                      if(controller.file!=null)
                        SvgPicture.file(controller.file!,height: 80,),
                      const SizedBox(
                        height: 40,
                      ),
                      SharedButton(
                        text: 'save category'.tr,
                        isLoading: controller.statusRequest==StatusRequest.loading,
                        onPressed: () {
                          if (controller.key.currentState!.validate()) {
                            controller.addCategory();
                          }
                        },
                        textStyle:
                            textStyle.Bold22.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
