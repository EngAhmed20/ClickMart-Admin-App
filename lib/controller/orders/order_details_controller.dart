import 'package:ecommerce_admin/data/model/order_model.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/model/order_details_model.dart';
import '../../data/remote/order_details_data.dart';

class OrderDetailsController extends GetxController{
  late OrderModel orderModel;
  List<OrderDetailsModel>data=[];
  StatusRequest statusRequest =StatusRequest.none;
  OrderDetailsData orderDetailsData=OrderDetailsData(Get.find());
  MyServices myServices=Get.find();
  getOrderDetails()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    update();

    var response=await orderDetailsData.getData(orderModel.ordersId.toString()!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        List listData=response['data'];
        data.addAll(listData.map((e)=>OrderDetailsModel.fromJson(e)));
        print('getOrderDetails');
      }else{
        statusRequest=StatusRequest.failure;

      }

    }else{
      statusRequest=StatusRequest.failure;

    }
    update();


  }


  @override
  void onInit() async{
    orderModel=await Get.arguments[
    'orderModel'
    ];
    getOrderDetails();
    super.onInit();
  }
}