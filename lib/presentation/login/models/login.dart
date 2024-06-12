
import 'package:training/presentation/signup/models/crud.dart';

import '../../../core/network/linkapi.dart';


class loginDate{

  Crud crud;
  loginDate(this.crud);
  loginData(String email,String password)async{
   var response= await crud.postData(AppLink.login, {
   "email" : email ,
    "password" :  password,
    
   
   


   });
  return response.fold((l) => l, (r) => r);
  }
  
}