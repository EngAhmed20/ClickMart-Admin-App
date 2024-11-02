import 'dart:io';

import '../../core/class/crud.dart';
import '../../core/constant/api_link.dart';

class CategoriseData {
  Crud crud;
  CategoriseData(this.crud);
  getData()async{
    var response = await crud.postData(AppLinks.categoryLink, {
    });
    return response.fold((l)=>l, (r)=>r);
  }
  addData(Map data,File file)async{
    var response = await crud.addRequestWithImageOne(AppLinks.addCategoryLink, data,file);
    return response.fold((l)=>l, (r)=>r);
  }
  removeData(Map data)async{
    var response = await crud.postData(AppLinks.deleteCategoryLink, data);
    return response.fold((l)=>l, (r)=>r);

  }
  editData(Map data,[File? file])async{
    var response;
    if(file==null){
      response = await crud.postData(AppLinks.editCategoryLink,data);
    }else{
       response = await crud.addRequestWithImageOne(AppLinks.editCategoryLink,data,file);

    }
    return response.fold((l)=>l, (r)=>r);
  }

}