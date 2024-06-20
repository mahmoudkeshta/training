import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class r{

  Crud crud;
  r(this.crud);
  Verifica2(String email,String password)async{
   var response= await crud.postData(AppLink.resetpassword, {
   "users_email" : email ,
    "users_password" :  password,
    
   });
  return response.fold((l) => l, (r) => r);
  }
  
}