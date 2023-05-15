import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class CompleteINformationAdmin extends StatefulWidget{
  @override
  _CompleteINformationAdminState createState() => _CompleteINformationAdminState();
}

class _CompleteINformationAdminState extends State<CompleteINformationAdmin> { 

  ImagePicker picker = ImagePicker();
  XFile? image ;
  // Image? image;

//     File file = File('test.png');
// String encodedImagePath = base64Encode( file.readAsBytes());


  Future<Image> convertFileToImage( File picture) async {
  List<int> imageBase64 = picture.readAsBytesSync();
  String imageAsString = base64Encode(imageBase64);
  Uint8List uint8list = base64.decode(imageAsString);
  Image image = Image.memory(uint8list);
  return image;
}





  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
          appBar: AppBar(
            title: Text("Image Picker from Gallery"),
            backgroundColor: Colors.redAccent
          ),
          body: Container(
            padding: EdgeInsets.only(top:20, left:20, right:20),
            alignment: Alignment.topCenter,
            child: Column(
              children: [

                 ElevatedButton(
                  onPressed: () async {
                      // image = await picker.pickImage(source: ImageSource.gallery); 
                      image = await picker.pickImage(source: ImageSource.camera);
                      setState(() {
                        //update UI
                      });
                  }, 
                  child: Text("Pick Image")
                ),
 

                image == null? Container():

                  //  final bytes = File(productController.image!.path).readAsBytesSync();
  //  String base64Image =  "data:image/png;base64,"+ base64Encode(bytes);
                // Image.asset(base64Encode(File(image!.path).readAsBytesSync())),
             
          
                Image.file(File(image!.path)),
                // Image.network((File(image!.path)).toString())
                // Image.asset( image!.path ),


               



               ClipOval(
            
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
                       
                            // image = await picker.pickImage(source: ImageSource.camera),

                     image = await picker.pickImage(source: ImageSource.camera)
                     


                    // source: from Camera ? ImageSource.camera : ImageSource.gallery)
                    // if(pickedFile != null){
                    //   profileImage = File(pickedFile.path);
                    // }
                            

                        },
                        
                        child: Text('انتخاب از دوربین'), ),
                       Divider(),
                       InkWell(
                        onTap: () async=> {
                         image = await picker.pickImage(source: ImageSource.camera)
 
                        },
                        
                        child: Text('انتخاب از گالری'),)
                  ],
                  )))



                 ,)
               },
           
              
            //  child:    image == null? Container():
            //     Image.asset(File(image!.path).readAsStringSync())
               
),))









                
            ],)
          )
       );
  }
}