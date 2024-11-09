
import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class Verification{

  Crud crud;
  Verification(this.crud);
  Verifica(String email,String verfiycode)async{
   var response= await crud.postData(AppLink.verifycode, {
   "users_email" : email ,
    "users_verfiycode" :  verfiycode,
    
   });
  return response.fold((l) => l, (r) => r);
  }
  r(String email,String verfiycode)async{
   var response= await crud.postData(AppLink.verify, {
   "users_email" : email ,
    "users_verfiycode" :  verfiycode,
    
   });
  return response.fold((l) => l, (r) => r);
  }
  
}