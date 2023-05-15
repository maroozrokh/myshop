import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.maxLines, required this.hintText, this.inputFormatters,  this.validator ,this.labelTxt, this.myController, this.initialValue });
  // TextEditingController? myColntroller;
  // String? hint;
    final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? myController;
  final String? labelTxt;
  final int?  maxLines ;
 final String? initialValue;

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.fromLTRB(40, 10, 40, 10),
      child:
      Directionality(textDirection: TextDirection.rtl , child: 
       TextFormField(
        initialValue: initialValue,
         maxLines: maxLines,
        
       
        inputFormatters: inputFormatters,
        validator: validator ,
         controller: myController,
          textAlign:TextAlign.right,
          
        decoration: InputDecoration(hintText: hintText ,
         labelText: labelTxt,
         
        
          focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 125, 125, 125),
                    width: 2.0,
                  ),
                ),
        
        
         ),
      ),)
      
      
    );
  
}
}