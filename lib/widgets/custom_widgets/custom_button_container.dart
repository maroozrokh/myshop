import 'package:flutter/material.dart';

class CustomBtnContainer extends StatelessWidget {
  const CustomBtnContainer({super.key, this.fonrWeigth, this.fontFamily,this.colorBtn, this.textBtn, this.iconBtn, this.colorIconBtn, this.colorTxtBtn, this.onTap,  this.height, this.weigth, this.radius});
  final Color? colorBtn ;
  final Color? colorTxtBtn ;
  final String? textBtn ;
  final IconData? iconBtn;
  final Color? colorIconBtn ;
  final Function()? onTap ;
  final double?  height;
  final double?  weigth;
  final double?  radius;
  final FontWeight? fonrWeigth;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
      onTap: onTap,
      child:    
    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: height ?? 30, vertical: weigth ?? 10),
                      decoration: BoxDecoration(
                          color: colorBtn,
                          borderRadius: BorderRadius.circular(radius ?? 15.0)),
                      child: 
                      
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          textBtn ?? '',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: colorTxtBtn , 
                               fontWeight: fonrWeigth,
                              fontFamily: fontFamily,
                              
                              ),
                        ),
                        SizedBox(
                          // width: 15.0,
                        ),
                        Icon(
                          iconBtn,
                          color: colorIconBtn,
                        )
                     ]) 
              )  );
  }
}