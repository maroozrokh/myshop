import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:myshop/core/http_backend/http_config.dart';
import 'package:myshop/models/product_model/product_model.dart';
import 'package:myshop/models/tag_model/tags_model.dart';
import 'package:myshop/models/user_model/users.dart';

class TagRepository{
  final  _dio = dioConfig();
 

 

  Future<Either<String,List<TagsModel>>> getTags() async{
    var tag = await _dio.get('tags');

    try {
      final result = tag.data.map<TagsModel>((e)=> 
     
        TagsModel.fromJson(e)).toList();
        
        return Right(result);

        
    } catch (e) {
      return Left(e.toString());
    }

  }



  Future<void> removeTags(int id,) async{
    var tag = await _dio.delete('tags/$id');



  }



  
  Future<void> editeTags(int id,TagsModel tags) async{
    var tag = await _dio.put('tags/$id',data: tags.toJson());



  }

    Future<void> editTagss({required TagsModel tagsModel, required int id}) async{
    try{
      var result = await _dio.put('user/${id}', data: tagsModel.toJson());
      
      // TagsModel retrievedUser = TagsModel.fromJson(response.data);
      // return retrievedUser;
    }
    catch(e){
      print('***edit tag error*** ${e.toString()}');
          print(e.toString());
    }
  }

  
 Future<Either<String,TagsModel>> editeTagsss(TagsModel tag,int id)async{
    TagsModel? tags ;


       try {

        var result = await _dio.put('tags/$id', data: tag.toJson());
          print('tag created');
          tags = TagsModel.fromJson(result.data);
    
        return Right(tags);

        
    } catch (e) {
      return Left(e.toString());
    }
 }




  
 Future<Either<String,TagsModel>> addTags(TagsModel tag)async{
    TagsModel? tags ;


       try {

        var result = await _dio.post('tags', data: tag.toJson());
          print('tag created');
          tags = TagsModel.fromJson(result.data);
    
        return Right(tags);

        
    } catch (e) {
      return Left(e.toString());
    }
 }

 


  }




  

