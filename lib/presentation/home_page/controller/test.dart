
import 'package:training/presentation/signup/models/crud.dart';

import '../../../core/network/linkapi.dart';


class TestData{

  Crud crud;
  TestData(this.crud);
  getDate()async{
   var response= await crud.postData(AppLink.home, {});
  return response.fold((l) => l, (r) => r);
  }
  
}