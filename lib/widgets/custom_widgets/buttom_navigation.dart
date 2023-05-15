import 'package:flutter/material.dart';
 
import 'package:myshop/core/constVariable.dart';
import 'package:myshop/controllers/home_controller/home_controller.dart';
import 'package:myshop/widgets/custom_widgets/searchbar.dart';

 
 import 'package:get/get.dart';

 

class ButtonNavigationss extends StatelessWidget {
    ButtonNavigationss({Key? key}) : super(key: key);
      HomeController homeController = Get.find<HomeController>();
 
  
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              homeController.pageIndex.value = 0;
              print( homeController.pageIndex.value);
      
             
            },
            icon:  ConstaVariable.pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
 
              homeController.pageIndex.value = 1;

            
            },
            icon:  ConstaVariable.pageIndex == 1
                ? const Icon(
                    Icons.work_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
          
                               homeController.pageIndex.value = 2;
 
              
            },
            icon:  ConstaVariable.pageIndex == 2
                ? const Icon(
                    Icons.widgets_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.widgets_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
                           homeController.pageIndex.value = 3;
 

            },
            icon: ConstaVariable. pageIndex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
        ],
      ),
    );


  }
}
  

  

