import 'package:ecommerce_admin/data/model/order_model.dart';
import 'package:ecommerce_admin/data/remote/orders_data.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/add_remove_snack.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';

class OrderUnderApprovalController extends GetxController{
  OrdersData ordersData=OrdersData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices=Get.find();
  List <OrderModel>orderModel=[];
  getHomeData()async{
    orderModel.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await ordersData.getOrders('0');
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        List homeData=response['data'];
        orderModel=homeData.map((data)=>OrderModel.fromJson(data)).toList();
        print("sucesss get items");

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  approveOrder(String orderId,String userId)async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await ordersData.orderApprove(orderId,userId);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        add_removeSnack('order confirmed msg');

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
    getHomeData();
  }

  @override
  void onInit() async{
    await getHomeData();
    super.onInit();
  }
  @override
  void onClose() {
    print("closed");
    super.onClose();
  }
  goToDetails(int index){
    Get.toNamed('/details',arguments:{
      'orderModel':orderModel[index]
    });
  }

}