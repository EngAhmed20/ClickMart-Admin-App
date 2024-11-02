import 'package:ecommerce_admin/binding.dart';
import 'package:ecommerce_admin/core/constant/page_route.dart';
import 'package:ecommerce_admin/core/localization/translation.dart';
import 'package:ecommerce_admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/change_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CallServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   LocalController localController= Get.put(LocalController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,


      ),
      getPages:pageRoutes,
      translations: MyTranslation(),
      locale: localController.initial,
      debugShowCheckedModeBanner: false,
      initialBinding:MyBinding() ,
    );
  }
}

