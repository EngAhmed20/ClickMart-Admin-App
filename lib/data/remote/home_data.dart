import 'package:ecommerce_admin/core/constant/api_link.dart';

import '../../core/class/crud.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData()async{
    var response = await crud.postData(AppLinks.HomeOrders, {
    });
   return response.fold((l)=>l, (r)=>r);
  }
  acceptDeliveryOrderData(String orderId,String userId,String deliveryId)async{
    var response =await crud.postData(AppLinks.acceptDelivery,{
      'orderid':orderId,
      'userid': userId,
      'deliveryid': deliveryId

    });
    return response.fold((l)=>l, (r)=>r);

  }
  getAcceptedData(String userId)async{
    var response = await crud.postData(AppLinks.HomeOrders, {
      'id':userId
    });
    return response.fold((l)=>l, (r)=>r);
  }
}