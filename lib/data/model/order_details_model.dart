class OrderDetailsModel {
  int? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? cartOrders;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCategories;
  int? itemsRating;
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
  int? addressId;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;

  OrderDetailsModel(
      {this.itemsprice,
        this.countitems,
        this.cartId,
        this.cartUsersid,
        this.cartItemsid,
        this.cartOrders,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCategories,
        this.itemsRating,
        this.ordersId,
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
        this.addressId,
        this.addressUsersid,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.addressName});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    itemsRating = json['items_rating'];
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
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    data['items_rating'] = this.itemsRating;
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
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_name'] = this.addressName;
    return data;
  }
}