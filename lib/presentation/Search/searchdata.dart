import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class datasearch{

  Crud crud;
  datasearch(this.crud);
  datasearchON(String search)async{
   var response= await crud.postData(AppLink.search, {
   "CourseTitle" : search 
   
   });
  return response.fold((l) => l, (r) => r);
  }
  
}