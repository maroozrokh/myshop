 
import 'package:flutter/material.dart';
import 'package:myshop/core/constVariable.dart';
import 'package:myshop/controllers/home_controller/home_controller.dart';
import 'package:myshop/widgets/custom_widgets/tag_list.dart';
import 'package:myshop/widgets/custom_widgets/custom_product_items.dart';
import 'package:myshop/widgets/custom_widgets/custom_search_delegate.dart';
import 'package:myshop/widgets/custom_widgets/custom_button_container.dart';
import 'package:myshop/widgets/custom_widgets/custom_textfield.dart';
import 'package:myshop/widgets/custom_widgets/searchbar.dart';
import 'package:get/get.dart';
import 'package:myshop/controllers/tag_controller/tags_controller.dart';
import 'package:myshop/widgets/custom_widgets/custom_dialog.dart';
import 'package:myshop/models/tag_model/tags_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminTagView extends StatelessWidget {
    AdminTagView({Key? key}) : super(key: key);

    final prefs =    SharedPreferences.getInstance();

  

   TagsController tagController = Get.find<TagsController>();
 

     Future<void> setLength(int length)async{
        SharedPreferences prefs =  await SharedPreferences.getInstance();
        prefs.setInt('saveLength', length);


  }
  

  @override
  Widget build(BuildContext context) {
     
    return  Scaffold(
      appBar: AppBar(
        title: Text('اضافه کردن تگ'),
        actions: [
          IconButton(
              onPressed: (){
                 tagController.searchItemTags();
                showSearch(context: context,delegate: CustomSearchDelegate(),);
              },
              icon: const Icon(Icons.search),)
        ],
      ),
      body:
     
         ListView(
        shrinkWrap: true,
        children:[ 
          Column(
        
        
        children: [
 
      CustomTextField(hintText: 'تگ جدید',labelTxt: 'تگ جدید',myController: tagController.tagController,),
  
      CustomBtnContainer(colorBtn: ConstaVariable.kblue,colorTxtBtn: ConstaVariable.kwhite,textBtn: 'ذخیره',
      onTap: ()  =>   {
 
           tagController.addTagWithoudDuplicated(tagController.tagController.text),
 

      }, ),
      SizedBox(height: 20,),
       SizedBox(
    
      child:
     Obx(() => 
     TagsListWidget(length: tagController.tagList.value.length ,tagController: tagController),
      // ListView.builder  ( 
      //    shrinkWrap: true,
      //    itemCount: tagController.tagList.value.length  ,
         
      //   itemBuilder: (context, index) =>  
      //    tagController.tagList.value.length != 0 ? 
   
      //    CustomProductListItem(
      //     widgetList:[
      //       InkWell(
      //         child: Icon(Icons.edit),
      //         onTap: ()async => {
            
      //          tagController.setDateToediteTag(index),
      //           tagController.showDialogToToEditeTag(context ),
      //           print(tagController.tagsModel)
             
              


      //       },),
      //       SizedBox(width: 10,),
          
      //        InkWell(child: Icon(Icons.delete),onTap: () => {
      //         tagController.id.value = tagController.tagList.value[index].id!,
      //         tagController.removeTags(),
      //          },),
 
 
      //       SizedBox(width: 40,),

      //         Obx(() => Text(tagController.tagList.value[index].tagName.toString() ?? '')),
          

       
      //       ],): null
      //     ,
     
      // ) ) 
      ),),   
       

      ],)])  
       
     



    );
  }
}