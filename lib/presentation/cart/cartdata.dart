import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class cartdata{

   Crud crud;
  cartdata(this.crud);
  addcart(String users ,String items)async{
   var response= await crud.postData(AppLink.cartadd, {"cart_user":users,"cart_item":items});
  return response.fold((l) => l, (r) => r);
  }
removecart(String users1 ,String items1)async{
   var response= await crud.postData(AppLink.cartremove, {"cart_user":users1,"cart_item":items1});
  return response.fold((l) => l, (r) => r);
  }
  
 
  getview(String id)async{
   var response= await crud.postData(AppLink.cartview, {"id":id});
  return response.fold((l) => l, (r) => r);
  }

    gedelall(String id)async{
   var response= await crud.postData(AppLink.det, {"id":id});
  return response.fold((l) => l, (r) => r);
  }
}