import 'package:flutter/material.dart';
import 'package:myshop/pages/admin/admin_add_product.dart';
import 'package:myshop/pages/admin/admin_page.dart';
import 'package:get/get.dart';
import 'package:myshop/models/product_model/product_model.dart';
void  routetoAdminHomePage(BuildContext context){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AdminPageView()));
              
}

void routeAdminAddProduct(ProductModel productModel){
  Get.to(AdminAddProductView( productModel: productModel ) );

}