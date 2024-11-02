class OrderModel {
  int? ordersId;
  int? ordersUsersId;
  int? ordersAddress;
  String? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersCoupon;
  String? ordersDatetime;
  String? ordersPaymentmethod;
  int? ordersTotalprice;
  int? ordersStatus;
  int? ordersRating;
  String? ordersNoterating;
  int? ordersDelivery;

  OrderModel(
      {this.ordersId,
        this.ordersUsersId,
        this.ordersAddress,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersCoupon,
        this.ordersDatetime,
        this.ordersPaymentmethod,
        this.ordersTotalprice,
        this.ordersStatus,
        this.ordersRating,
        this.ordersNoterating,
        this.ordersDelivery});

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersId = json['orders_users_id'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersTotalprice = json['orders_totalprice'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersDelivery = json['orders_delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_users_id'] = this.ordersUsersId;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_status'] = this.ordersStatus;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['orders_delivery'] = this.ordersDelivery;
    return data;
  }
}