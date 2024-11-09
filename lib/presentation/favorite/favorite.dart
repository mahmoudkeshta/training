import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class favoritedata{

   Crud crud;
  favoritedata(this.crud);
  addfavorite(String users ,String items)async{
   var response= await crud.postData(AppLink.favoriteadd, {"favorite_user":users,"favorite_item":items});
  return response.fold((l) => l, (r) => r);
  }
removefavorite(String users1 ,String items1)async{
   var response= await crud.postData(AppLink.favoriteremove, {"favorite_user":users1,"favorite_item":items1});
  return response.fold((l) => l, (r) => r);
  }
  
}