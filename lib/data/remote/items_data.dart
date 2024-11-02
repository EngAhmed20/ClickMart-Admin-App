import 'dart:io';

import '../../core/class/crud.dart';
import '../../core/constant/api_link.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData()async{
    var response = await crud.postData(AppLinks.itemsLink, {
    });
    return response.fold((l)=>l, (r)=>r);
  }
  addData(Map data,File file)async{
    var response = await crud.addRequestWithImageOne(AppLinks.addItemsLink, data,file);
    return response.fold((l)=>l, (r)=>r);
  }
  removeData(Map data)async{
    var response = await crud.postData(AppLinks.deleteItemsLink, data);
    return response.fold((l)=>l, (r)=>r);

  }
  editData(Map data,[File? file])async{
    var response;
    if(file==null){
      response = await crud.postData(AppLinks.editItemsLink,data);
    }else{
      response = await crud.addRequestWithImageOne(AppLinks.editItemsLink,data,file);

    }
    return response.fold((l)=>l, (r)=>r);
  }

}