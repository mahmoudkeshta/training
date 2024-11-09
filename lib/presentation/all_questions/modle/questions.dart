import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class questionsdata{

   Crud crud;
  questionsdata(this.crud);
  getquestionsdata(String id ,String e)async{
   var response= await crud.postData(AppLink.questionsdata, {"id":id,"e":e});
  return response.fold((l) => l, (r) => r);
  }
  addresults(String student_id ,String exam_id,String score,String duration)async{
   var response= await crud.postData(AppLink.addresults, {"student_id":student_id,"exam_id":exam_id,"score":score,"duration":duration});
  return response.fold((l) => l, (r) => r);
  }

viewgrades(String id )async{
   var response= await crud.postData(AppLink.viewgrades, {"id":id});
  return response.fold((l) => l, (r) => r);
  }

}