
import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class mycourselist{

  Crud crud;
  mycourselist(this.crud);
  getDate(String users)async{
   var response= await crud.postData(AppLink.showcourse, {"UserID":users});
  return response.fold((l) => l, (r) => r);
  }


}