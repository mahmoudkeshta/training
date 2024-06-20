import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class checkemail{

  Crud crud;
  checkemail(this.crud);
  check(String email)async{
   var response= await crud.postData(AppLink.checkemail, {
   "users_email" : email ,
   
    
   });
  return response.fold((l) => l, (r) => r);
  }
  
}