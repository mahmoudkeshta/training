
import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class Homedata{

  Crud crud;
  Homedata(this.crud);
  getDate()async{
   var response= await crud.postData(AppLink.home, {});
  return response.fold((l) => l, (r) => r);
  }

   getsearch(String search )async{
   var response= await crud.postData(AppLink.search, {"search":search});
  return response.fold((l) => l, (r) => r);
  }
  
     getatiem(String usersid )async{
   var response= await crud.postData(AppLink.items, {"usersid":usersid});
  return response.fold((l) => l, (r) => r);
  }
  
  
  
}