class AppLinks{
  static const String serverLink="http://10.0.2.2/ecommerce/";
  static const String testLink="${serverLink}test.php";
  static const String loginLink="${serverLink}admin/auth/login.php";
  //======================forget pass==========================//
  static const String checkEmailLink="${serverLink}admin/auth/forgetpassword/checkemail.php";
  static const String verifyResetLink="${serverLink}admin/auth/forgetpassword/verifycode.php";
  static const String resetPasswordLink="${serverLink}admin/auth/forgetpassword/resetpassword.php";
  //======================categories==========================//
  static const String categoryLink="${serverLink}admin/categories/view.php";
  static const String addCategoryLink="${serverLink}admin/categories/add.php";
  static const String editCategoryLink="${serverLink}admin/categories/edit.php";
  static const String deleteCategoryLink="${serverLink}admin/categories/delete.php";
  static const String categoryImg="${serverLink}upload/categories/";
  //======================products==========================//
  static const String itemsLink="${serverLink}admin/items/view.php";
  static const String addItemsLink="${serverLink}admin/items/add.php";
  static const String editItemsLink="${serverLink}admin/items/edit.php";
  static const String deleteItemsLink="${serverLink}admin/items/delete.php";
  static const String itemsImg="${serverLink}upload/items/";
  //======================orders==========================//
  static const String ordersView="${serverLink}admin/orders/view.php";
  static const orderDetailsLink="${serverLink}admin/orders/order_details.php";
  static const String approveOrderLink="${serverLink}admin/orders/approve.php";
  static const String prepOrderLink="${serverLink}admin/orders/prepare.php";
  static const String deleteOrdersLink="${serverLink}admin/orders/delete.php";
  static const String ordersImg="${serverLink}upload/orders/";
  //======================customers==========================//

  //======================root_home==========================//
  static const String homeLink="${serverLink}root_home.php";
  static const String HomeOrders="${serverLink}delivery/orders/view.php";
  static const String acceptDelivery="${serverLink}delivery/orders/approve.php";
  static const String completeDelivery="${serverLink}delivery/orders/done.php";
  static const String acceptedOrders="${serverLink}delivery/orders/accepted.php";
  static const String getArchiveData="${serverLink}delivery/orders/archive.php";

}