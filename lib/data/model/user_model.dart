class AdminModel {
  int? adminId;
  String? adminName;
  String? adminEmail;
  String? adminPhone;
  int? adminVerifycode;
  int? adminApprove;
  String? adminCreate;
  String? adminPassword;

  AdminModel(
      {this.adminId,
        this.adminName,
        this.adminEmail,
        this.adminPhone,
        this.adminVerifycode,
        this.adminApprove,
        this.adminCreate,
        this.adminPassword});

  AdminModel.fromJson(Map<String, dynamic> json) {
    adminId = json['admin_id'];
    adminName = json['admin_name'];
    adminEmail = json['admin_email'];
    adminPhone = json['admin_phone'];
    adminVerifycode = json['admin_verifycode'];
    adminApprove = json['admin_approve'];
    adminCreate = json['admin_create'];
    adminPassword = json['admin_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_id'] = this.adminId;
    data['admin_name'] = this.adminName;
    data['admin_email'] = this.adminEmail;
    data['admin_phone'] = this.adminPhone;
    data['admin_verifycode'] = this.adminVerifycode;
    data['admin_approve'] = this.adminApprove;
    data['admin_create'] = this.adminCreate;
    data['admin_password'] = this.adminPassword;
    return data;
  }
}