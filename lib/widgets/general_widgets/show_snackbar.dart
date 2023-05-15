import 'package:flutter/material.dart';

class ShowSnackBar{



  
 static void showSnackBar(BuildContext context,String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  

  
}