import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class Verification1{

  Crud crud;
  Verification1(this.crud);
  Verifica1(String email,String verfiycode)async{
   var response= await crud.postData(AppLink.verify, {
   "users_email" : email ,
    "users_verfiycode" :  verfiycode,
    
   });
  return response.fold((l) => l, (r) => r);
  }
  
}