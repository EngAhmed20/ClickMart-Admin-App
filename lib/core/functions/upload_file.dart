import 'dart:io';

import 'package:ecommerce_admin/core/constant/app_string.dart';
import 'package:ecommerce_admin/core/shared/app_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async{
  final XFile? file=await ImagePicker().pickImage(source:ImageSource.camera,imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    print('No file selected.');
    return null;
  }
}
fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? [
              'svg',
              'SVG'
            ]
          : [
              'jpg',
              'JPG',
              'gif',
              'GIF',
              'jpeg',
              'PNG',
              'png',
              'bmp',
              'JPEG'
            ]);
  if (result != null) {
    print('File uploaded successfully: ${result.files.single.path}');
    return File(result.files.single.path!);
  } else {
    print('No file selected.');
    return null;
  }
}
openCameraOrGallery(openCamera,openGallery) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor:AppColors.thirdColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                openCamera();
                Get.back();
              },
              title: Text(
                'upload from camera'.tr,
                style: textStyle.semiBold18.copyWith(color: Colors.white),
              ),
              leading: const Icon(
                Icons.camera_alt_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {
                openGallery();
                Get.back();
              },
              title: Text(
                'upload from gallery'.tr,
                style: textStyle.semiBold18.copyWith(color: Colors.white),
              ),
              leading: const Icon(
                Icons.image_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
