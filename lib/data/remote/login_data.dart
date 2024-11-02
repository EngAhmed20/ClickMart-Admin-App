

import '../../core/class/crud.dart';
import '../../core/constant/api_link.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);
  loginData(String email,String password)async{
    var response = await crud.postData(AppLinks.loginLink,{
      'email':email,
      'password':password,
    });
    return response.fold((l)=>l, (r)=>r);
  }

}