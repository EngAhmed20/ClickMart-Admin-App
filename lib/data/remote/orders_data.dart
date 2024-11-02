import 'package:ecommerce_admin/core/class/crud.dart';
import 'package:ecommerce_admin/core/constant/api_link.dart';

class OrdersData{
  Crud crud;
  OrdersData(this.crud);
  getOrders(String orderState)async{
   var response=await crud.postData(AppLinks.ordersView,{
     'orderState':orderState
   });
   return response.fold((l)=>l, (r)=>r);
  }
  orderApprove(String orderId,String userId)async{
    var response=await crud.postData(AppLinks.approveOrderLink,{
      'orderid':orderId,
      'userid':userId

    });
    return response.fold((l)=>l, (r)=>r);
  }
  orderPrep(String orderId,String userId,orderType)async{
    var response=await crud.postData(AppLinks.prepOrderLink,{
      'orderid':orderId,
      'userid':userId,
      'ordertype':orderType

    });
    return response.fold((l)=>l, (r)=>r);
  }

}