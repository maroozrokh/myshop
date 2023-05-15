import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myshop/core/constVariable.dart';
import 'package:myshop/widgets/custom_widgets/custom_button_container.dart';
import 'package:myshop/widgets/custom_widgets/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';


class AdminProfieView extends StatelessWidget {
  const AdminProfieView({Key? key}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {
List<String> _selectedItems = [];
  ImagePicker picker = ImagePicker();
  XFile? image;

 
    
    return  Scaffold(
      body:
      SafeArea(child: 
      ListView(children: [   
    
      Column(children: [
        Stack(children: [
          InkWell(
            child:         
         
          Container(
            width: 200,
            height: 200,
            
            child:  ClipOval(
            
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: 
            InkWell(
              onTap: () => {
                showModalBottomSheet(context: context, builder: (context) =>  
                  
                SizedBox(
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  <Widget>[
                       InkWell(
                        onTap: ()async => {
                            image = await picker.pickImage(source: ImageSource.camera),
                     
                            

                        },
                        
                        child: Text('انتخاب از دوربین'),),
                       Divider(),
                       InkWell(
                        onTap: () async=> {
                       image = await picker.pickImage(source: ImageSource.gallery),

                        },
                        
                        child: Text('انتخاب از گالری'),)
                    ],
                  )))



                 ,)
               },
              
              child: image == null? Image.asset(ConstaVariable.imageList![1]): Image.file(File(image.path) ) ,),
)
              
            
          ) ), ),

         
             
         
                  Positioned(
                    top: 160,
                    left: 160,
                    child: 
                    InkWell(child:  
                    
                    Icon(Icons.camera_alt_rounded , size: 40,),),)
                  


        ],),
        SizedBox(height: 30,),
           
           CustomTextField(hintText: 'نام کاربری',labelTxt: 'نام کاربری',),
           CustomTextField(hintText: 'موبایل',labelTxt: 'موبایل',),
     
            
            SizedBox(height: 20,),
            CustomBtnContainer(colorBtn: ConstaVariable.kblue, colorTxtBtn: ConstaVariable.kwhite,textBtn: 'ذخیره ',height: 100,)
         

      ],)  ],)  ,)
 
    );
  }
}




