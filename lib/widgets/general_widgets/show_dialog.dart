

 import 'package:flutter/material.dart';
import 'package:myshop/widgets/custom_widgets/custom_dialog.dart';

void showDialogMethode({dynamic? values,double? heigth,BuildContext? context,String? alerttitle,String? saveTxt,String?  cancellTxt ,  List<Widget>? widgetsItem, Function()? func1 , Function()? func2}){  
    showDialog(
        context: context! ,
        builder: (
          BuildContext context,
        ) {
          return CustomDialog(
            alertTxt: alerttitle,
            heigth: heigth,
            saveText: saveTxt,
            cancelText: cancellTxt,
            widgetsItem: widgetsItem,
            myOnPress:  func1,
            myOnPressCancel: func2
          );
        }) .then((value){
    
             values;
     
     

  });
  }