import 'package:dio/dio.dart';


 
Dio dioConfig() {
  return Dio(BaseOptions(
      baseUrl: "http://localhost:3000/",
      connectTimeout: Duration(seconds: 5)
    
  ));
}