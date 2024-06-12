
import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class signup{

  Crud crud;
  signup(this.crud);
  postDate(String username,String password,String email, String phone)async{
   var response= await crud.postData(AppLink.signup, {
    "username" : username ,
    "password" :  password,
    "email" : email ,
    "phone" : phone ,
   


   });
  return response.fold((l) => l, (r) => r);
  }
  
}