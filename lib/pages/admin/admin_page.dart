import 'package:flutter/material.dart';
import 'package:myshop/pages/admin/admin_add_product.dart';
import 'package:myshop/pages/admin/admin_products.dart';
import 'package:myshop/pages/admin/admin_profile.dart';
import 'package:myshop/pages/admin/admin_tag.dart';
import 'package:myshop/widgets/custom_widgets/buttom_navigation.dart';
import 'package:myshop/pages/share_page/complete_demographic.dart';
import 'package:myshop/core/constVariable.dart';
import 'package:myshop/controllers/home_controller/home_controller.dart';
 import 'package:get/get.dart';
import 'package:myshop/models/user_model/users.dart';


class AdminPageView extends GetView<HomeController> {
    AdminPageView({ Key? key,this.userModel}): super(key: key);
    Users? userModel;
    // HomeController homeController = Get.find<HomeController>();


   // int pageIndex = 0;
  
  final pages = [
     CompleteDemographic(),
     AdminProductListVIew(),
     AdminTagView(),
     AdminAddProductView(),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonNavigationss(),

      body: 
      Obx(() =>  
      // ListView(children: [

     
      //   Column(
         
      //   children: [


      //      Expanded(child: 

          controller.pages[ controller.pageIndex.value],
          )
      // ],),   
      // ],)
      
      
      
    
    );
  }
}


 