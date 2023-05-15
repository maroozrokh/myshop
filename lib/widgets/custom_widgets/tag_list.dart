import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controllers/tag_controller/tags_controller.dart';
import 'package:myshop/widgets/custom_widgets/custom_product_items.dart';

class TagsListWidget extends StatelessWidget {
    TagsListWidget({super.key,this.length,this.result,this.tagController});
  int? length;
  TagsController? tagController;
  String? result;
   

  @override
  Widget build(BuildContext context) {
     
    return   ListView.builder  ( 
     
         shrinkWrap: true,
         itemCount:length  ,
         
        itemBuilder: (context, index) =>    

      
      
         CustomProductListItem(
          widgetList:[
            InkWell(
              child: Icon(Icons.edit),
              onTap: ()async => {
            
               tagController!.setDateToediteTag(index),
                // tagController!.id.value = tagController!.tagList.value[index].id!,
             
                tagController!.showDialogToToEditeTag(),
              
              


            },),
            SizedBox(width: 10,),
          
             InkWell(child: Icon(Icons.delete),onTap: () => {
              tagController!.id.value = tagController!.tagList.value[index].id!,
              tagController!.removeTags(),
               },),
 
 
            SizedBox(width: 40,),

              Obx(() => Text(tagController!.tagList.value[index].tagName.toString() ?? '')),
          
            // Text(result ?? '') ,
            //  ListTile(title: Text(result ?? ''),),
       
            ],)
          ,
     
      ) ;
  }
}