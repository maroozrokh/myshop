import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
    CustomDialog({super.key,required this.heigth  ,  this.widgetsItem,this.myOnPress,  required this.alertTxt , this.myOnPressCancel , this.cancelText,this.saveText});
     void Function()? myOnPress;
 
     String?  alertTxt;
     String?  saveText;
     String?  cancelText;
     double? heigth;
     List<Widget>? widgetsItem;
     void Function()? myOnPressCancel;
  

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
 


  
  @override
  Widget build(BuildContext context) {     
        return        
        AlertDialog(
            title: Text(widget.alertTxt ?? 'alert text'),  
            content: 
            Container(
              width: 300,
              height:widget.heigth,
              child:
            Column(          
 
              children: widget.widgetsItem ?? [ SizedBox()], 
           
             )
          ),
              
             
                actions: <Widget>[ 
                  ElevatedButton(  
                child: Text(widget.saveText ?? 'save'),             
                onPressed : widget.myOnPress
                    
              ) ,
                  ElevatedButton(  
                child: Text(widget.cancelText ?? 'cancell'),             
                onPressed : widget.myOnPressCancel
                    
              )   
            ],  
          ); 



    
    
  }
}