
import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class Favoritedataview{

   Crud crud;
  Favoritedataview(this.crud);
  getfavorite(String id)async{
   var response= await crud.postData(AppLink.favoriteview, {"id":id});
  return response.fold((l) => l, (r) => r);
  }
   deleteData(String id)async{
   var response= await crud.postData(AppLink.deletefromfavorite, {"id":id});
  return response.fold((l) => l, (r) => r);
  }
  }