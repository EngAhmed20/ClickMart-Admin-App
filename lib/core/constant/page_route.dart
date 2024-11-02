import 'package:ecommerce_admin/core/services/services.dart';
import 'package:ecommerce_admin/view/auth/widget/forget_pass.dart';
import 'package:ecommerce_admin/view/categories/categories_view.dart';
import 'package:ecommerce_admin/view/lang/lang_view.dart';
import 'package:ecommerce_admin/view/orders/orders_view.dart';
import 'package:ecommerce_admin/view/products/products_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../view/auth/login_scr.dart';
import '../../view/auth/widget/reset_pass.dart';
import '../../view/auth/widget/success_reset.dart';
import '../../view/auth/widget/verify_code.dart';
import '../../view/categories/categories_add.dart';
import '../../view/categories/categories_edit.dart';
import '../../view/orders/order_details.dart';
import '../../view/products/products_add.dart';
import '../../view/products/products_edit.dart';
import '../../view/root_home/root_home.dart';
import 'app_string.dart';
List<GetPage<dynamic>>? pageRoutes=[
  GetPage(name: '/', page:()=>LangView(),middlewares: [AppMiddleWare()]),
  GetPage(name: '/login', page:()=>LoginScr()),
  GetPage(name: '/forgetPass', page: ()=>ForgetPassScr()),
GetPage(name: '/resetPass', page:()=>ResetPassScr()) ,
GetPage(name: '/verifyPass', page:()=>VerifyCodeScr()) ,
  GetPage(name: '/sucessResetPass', page:()=>SuccessResetPass()) ,
  GetPage(name: '/root_home', page:()=>RootHome()) ,
  GetPage(name: '/categoriesview', page:()=>CategoriesView()),
  GetPage(name: '/categoriesadd', page:()=>AddCategories()),
  GetPage(name: '/categoriesedit', page:()=>EditCategories()),
  GetPage(name: '/ProductsView', page:()=>ProductsView()),
  GetPage(name: '/productsadd', page:()=>AddProducts()),
  GetPage(name: '/productsedit', page:()=>EditProducts()),
  GetPage(name: '/OrdersView', page: ()=>OrdersView()),
  GetPage(name: '/details', page: ()=>OrderDetailsScr()) ,







];
class AppMiddleWare extends GetMiddleware{
  MyServices myServices=Get.find();
  @override
  RouteSettings?redirect(String?route)
  {
    if (myServices.sharedPreferences.getBool('root_home')==true){
      return const  RouteSettings(name: '/root_home');
    }
    if(myServices.sharedPreferences.getString(boardingShow) != null)
    {
      return const  RouteSettings(name: '/login');
    }
  }
}