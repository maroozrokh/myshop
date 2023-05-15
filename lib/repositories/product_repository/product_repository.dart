 import 'package:dartz/dartz.dart';
import 'package:myshop/core/http_backend/http_config.dart';
import 'package:myshop/models/product_model/product_model.dart';
  
class ProductRepository{
   final  _dio = dioConfig(); 
 

    Future<void> removeProduct(int id,) async{
    var product = await _dio.delete('products/$id');
  } 
 



Future<Either<String,ProductModel>> editedProduct(ProductModel products,int id)async{
    ProductModel? product ;
       try {

        var result = await _dio.put('products/$id', data: products.toJson());
          print('products edited');
          product = ProductModel.fromJson(result.data);
    
        return Right(product);

        
    } catch (e) {
      return Left(e.toString());
    }
 }


 


  Future<Either<String,List<ProductModel>>> getProducts() async{
    var product = await _dio.get('products');

    try {
      final result = product.data.map<ProductModel>((e)=> 
        ProductModel.fromJson(e)).toList();
        return Right(result);

        
    } catch (e) {
      return Left(e.toString());
    }

  }


  // Future<List<ProductModel>> getProducts1() async{
  //   var product = await _dio.get('products');

  
  //     final result = product.data.map<ProductModel>((e)=> 
  //       ProductModel.fromJson(e)).toList();
  //       return  (result);
 

  // }
  

  
     


Future<Either<String, ProductModel >> addProducts(ProductModel product)async{
    ProductModel? products ;


       try {

        var result = await _dio.post('products', data: product.toJson());
          print('product created');
          products = ProductModel.fromJson(result.data);
    
        return Right(product);

        
    } catch (e) {
      return Left(e.toString());
    }

  }
 



 

}