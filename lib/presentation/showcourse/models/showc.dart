
import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';


class showc{

  Crud crud;
  showc(this.crud);
  postDate(int UserID,int CourseID)async{
   var response= await crud.postData(AppLink.test2, {
    "UserID" : UserID ,
    "CourseID" :  CourseID,
    


   });

   
  return response.fold((l) => l, (r) => r);
  }
   showview(String CourseID)async{
   var response= await crud.postData(AppLink.show, {

    "CourseID" :  CourseID,
    


   });

   
  return response.fold((l) => l, (r) => r);
  }
}