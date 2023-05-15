import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshop/pages/share_page/complete_demographic.dart';
import 'package:myshop/core/constVariable.dart';
import 'package:myshop/controllers/tag_controller/tags_controller.dart';
import 'package:myshop/widgets/custom_widgets/custom_button_container.dart';
import 'package:myshop/widgets/custom_widgets/custom_textfield.dart';
import 'package:myshop/core/extention_class.dart';
import 'package:myshop/controllers/registration_controller/registration_controller.dart';
import 'package:myshop/models/user_model/users.dart';
import 'package:get/get.dart';



class RegistOrLogInPage extends StatelessWidget {
   RegistOrLogInPage({super.key});
 

RegistrationController userController = Get.find<RegistrationController>();
// TagsController tt = Get.find<TagsController>();

 

  @override
  Widget build(BuildContext context) {
  //  Get.put(RegistrationController());


    final _formKey = GlobalKey<FormState>();
    var textContainer =     GetBuilder<RegistrationController>(builder: (RegistrationController){
      return userController.checkLogPage.value ?
      Text( 'ورود' ) : Text( 'ثبت نام');
      });
 
 
      

    return Scaffold(
      appBar: AppBar(backgroundColor: ConstaVariable.whiteappbar, elevation: 0,actions: [
        
     
        Padding(padding: EdgeInsets.all(10),child: Align(alignment: Alignment.center , child:Image.asset('assets/images/icon.png')),)  ,     
        Spacer(),
        Padding(padding: EdgeInsets.all(10),child:Align(alignment: Alignment.center , child:Icon(Icons.arrow_forward_sharp ,color: ConstaVariable.kblue,)),)
        
        ]),
      body: 
      ListView(children: [

     

         Form(
          key: _formKey,
          child: 
       
      Column(children: [
        SizedBox(height: 100,),
               
        Center(child:
        Obx(()=> Text(style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color:   ConstaVariable.kblack,
                    ), userController.checkLogPage.isTrue ? 'ثبت نام در کتابخون' : 'ورود به کتابخون'))
        
                    ),
        SizedBox(height: 20,),       
 
         CustomTextField(
                hintText: 'نام کاربری',
                labelTxt: 'نام کاربری',
                myController: userController.usenamecontroller,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )],
                  validator: (val) {
                  if (!val!.isValidName  ||  val.isEmpty) return 'نام کاربری معتبر نیست';
                },
                  
                  
                  ),

              CustomTextField(
                hintText: 'شماره تلفن',
                labelTxt: 'شماره تلفن',
               
                myController: userController.phonecontroller,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                   
                  )
                ],
                  validator: (val) {
                  if (!val!.isValidPhone ||  val.isEmpty) return 'شماره تلفن معتبر نیست';
                },
                                    
                  ),
                  SizedBox(height: 20,),
                  Obx(()=> 
                  userController.checkLogPage.isTrue ? 
              CustomBtnContainer(
                    onTap: (){
                      print('object');
 
                       if (_formKey.currentState!.validate()) {
                        print('next1');
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>  CompleteDemographic(userModel: userController.usersModel,)));

                   
                  //       // userController.usersModel.username = userController.usenamecontroller.text ; 
                  //       Get.to(CompleteDemographic());
                 
                  }
                    },
                    
                    
                    textBtn: 'تکمیل اطلاعات'  , 
                    colorBtn: ConstaVariable.kblue ,height: 90,weigth: 15,radius: 30,colorTxtBtn: ConstaVariable.kwhite,
                    fontFamily: 'Poppins' ,fonrWeigth: FontWeight.bold,
                    ) : SizedBox()),

                    SizedBox(height: 20,),

                  CustomBtnContainer(
                    onTap: (){
                      
                      userController.loginValidation(_formKey, context);
                      userController.logInforProfile.value = true;

                    },
      
                    
                    
                    textBtn: 'ادامه'  , colorBtn: ConstaVariable.kblue ,height: 120,weigth: 15,radius: 30,colorTxtBtn: ConstaVariable.kwhite,fontFamily: 'Poppins' ,fonrWeigth: FontWeight.bold,
                    ),
                    SizedBox(height: 10,),
                    Text('یا'),
                    Center(child: Expanded(
                      child:
                      Center(child: 
                    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Obx(() =>  Text(userController.checkLogPage.isTrue ? 'ثبت نام با گوگل' : 'ورود با گوگل' ,style: TextStyle(color: ConstaVariable.kblue,),),) ,
                      SizedBox(width:10),
                      SizedBox(child: Image.asset('assets/images/googleicon.png' , height: 20, width:20,)),
                      
                    ],)) )),
                    SizedBox(height: 150),
                     Center(child: Expanded(
                      child:
                      Center(child: 
                    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    InkWell(
                      onTap: () => {
                        userController.checkBooltoLoginOrregister(),
                      
                        
                      },
                      
                      child:
                      Obx(() =>  Text( userController.checkLogPage.isTrue? 'ورود ' : 'ثبت نام' ,                      
                                         
                        
                        
                         style: TextStyle(color: ConstaVariable.kblue))),  
                        ),
                    SizedBox(width:10),
                    Obx(() =>  Text(userController.checkLogPage.isTrue ? 'حساب کاربری داری؟ ' : 'حساب کاربری نداری؟')),
                   
                      
                    ],)) )),

                    // InkWell(child: Text('قوانین استفاده از خدمات کتابخون' , style: TextStyle(color: ConstaVariable.kblue)),)
        
             

      ],
       )
      )]),
        
 
    ); 
  }
  
  
  }
  
 