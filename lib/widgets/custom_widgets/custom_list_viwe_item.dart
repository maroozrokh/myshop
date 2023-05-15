
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
   CustomListItem({super.key ,this.myimage,this.introductionTxt, this.height, this.widget1,this.widget2,  this.onTap,  this.colorList, this.txtLogin });
  final String?  introductionTxt;
  final String?  txtLogin;
 final List<Color>? colorList;
 final Widget? widget1;
 final Widget? widget2;
 
 final double? height;
 String?  myimage;
  
 
  final Function()? onTap;
 

 

 


  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
      onTap: onTap,
       
      child:
     
      Padding(
        padding: EdgeInsets.only(top: 30,bottom: 30),
      //   child: Container(
       
   
        //  decoration: BoxDecoration(
        //  gradient: LinearGradient(
        //        colors:colorList ?? [Color.fromARGB(255, 128, 175, 199),Color.fromARGB(255, 255, 255, 255), ],
        //        begin: Alignment.bottomLeft,
        //        end: Alignment.topRight,),
        //        borderRadius: BorderRadius.circular(20),
          
          
          // ),
      
      child:
      Column(

        children:  
          [
        Expanded(flex: 1,child:Image.asset(myimage!,width: MediaQuery.of(context).size.width),
        ),
                        
         SizedBox(height: 50,),
          
        
     
        Expanded(flex: 1, child:  Container(alignment: Alignment.center, child:Text(introductionTxt ?? ' '))),
        SizedBox(child: widget1 ?? SizedBox()),
        SizedBox(child: widget2 ?? SizedBox()),    

        SizedBox(height: height, child:  Container(alignment: Alignment.center, child:Text(txtLogin ?? ''))),

          ],
         )
         ) 
        )

     ;
         
         
         
  }}