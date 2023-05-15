import 'package:flutter/material.dart';
import 'package:myshop/core/constVariable.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ConstaVariable.whiteappbar, elevation: 0,actions: [
        
     
        Padding(padding: EdgeInsets.all(10),child: Align(alignment: Alignment.center , child:Image.asset('assets/images/icon.png')),)  ,     
        Spacer(),
        Padding(padding: EdgeInsets.all(10),child:Align(alignment: Alignment.center , child:Icon(Icons.arrow_forward_sharp ,color: ConstaVariable.kblue,)),)
        
        ]),
      body: Container(),
    );
  }
}