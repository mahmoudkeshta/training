
import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class Homedata{

  Crud crud;
  Homedata(this.crud);
  getDate()async{
   var response= await crud.postData(AppLink.home, {});
  return response.fold((l) => l, (r) => r);
  }
  
  
}