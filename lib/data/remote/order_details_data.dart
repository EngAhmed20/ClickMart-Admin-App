import '../../core/class/crud.dart';
import '../../core/constant/api_link.dart';

class OrderDetailsData{
  Crud crud;
  OrderDetailsData(this.crud);
  getData(String orderId)async{
    var response=await crud.postData(AppLinks.orderDetailsLink,{
      'orderid':orderId,
    });
    return response.fold((l)=>l,(r)=>r);

  }
}