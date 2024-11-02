

import '../../core/class/crud.dart';
import '../../core/constant/api_link.dart';

class VerifyCodeResetData{
  Crud crud;
  VerifyCodeResetData(this.crud);
  verifyCodeResetData(String email,String code)async{
    var response=await crud.postData(AppLinks.verifyResetLink,{
      'email':email,
      'verifycode':code,
    });
    return response.fold((l)=>l,(r)=>r);

  }
}