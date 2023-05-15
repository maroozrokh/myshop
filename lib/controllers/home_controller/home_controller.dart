import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/pages/admin/admin_add_product.dart';
import 'package:myshop/pages/admin/admin_products.dart';
import 'package:myshop/pages/admin/admin_profile.dart';
import 'package:myshop/pages/admin/admin_tag.dart';
import 'package:myshop/pages/share_page/complete_demographic.dart';
import 'package:myshop/models/product_model/product_model.dart';
 import 'package:image_picker/image_picker.dart';



class HomeController extends GetxController{



  RxInt pageIndex = 0.obs;
  
 RxList pages = [
      AdminProductListVIew(),
      AdminAddProductView(),
      AdminTagView(),
      CompleteDemographic(),
     
      
    
  ].obs;



  
 




 @override
  void onInit() {
    
  }

@override
  void dispose() {
    super.dispose();
  }



  }