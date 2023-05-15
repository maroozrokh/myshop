import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:myshop/core/http_backend/http_config.dart';
import 'package:myshop/models/product_model/product_model.dart';
import 'package:myshop/models/tag_model/tags_model.dart';
import 'package:myshop/models/user_model/users.dart';

class UserRepository{ 



  Future<Either<String,List<Users>>> getUser() async{
    var user = await dioConfig().get('users');

    try {
      final result = user.data.map<Users>((e)=> 
        Users.fromJson(e)).toList();
        return Right(result);

        
    } catch (e) {
      return Left(e.toString());
    }

  }

 
 Future<Either<String,Users>> addUsers(Users user)async{
    Users? users ;


       try {

        var result = await dioConfig().post('users', data: user.toJson());
          print('user created');
          users = Users.fromJson(result.data);
    
        return Right(user);

        
    } catch (e) {
      return Left(e.toString());
    }


  

  }


 
Future<Either<String,Users>> editedUser(Users users,int id)async{
    Users? user ;


       try {

        var result = await dioConfig().put('users/$id', data: users.toJson());
          print('user edited');
          user = Users.fromJson(result.data);
    
        return Right(user);

        
    } catch (e) {
      return Left(e.toString());
    }
 }


 
    
     
 
}



 



 

  


  
 