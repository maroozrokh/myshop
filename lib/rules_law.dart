import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RulesAndLaws extends StatelessWidget {
  const RulesAndLaws({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: ListView(children: [
      Text('کلیه اصول و رویه های کتابخون بر اساس قوانین جمهوری اسلامی ایران ، قانون تجارت الکرترونیک'),
    ],),

    );
  }
}


 //     context: context,
                            //     builder: (context) => SizedBox(
                            //         height: 100,
                            //         child: Center(
                            //             child: Column(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.center,
                            //           children: <Widget>[
                            //             InkWell(
                            //               onTap: () async => {
                            //                 // image = await picker.pickImage(source: ImageSource.camera),

                            //                 productController.image =
                            //                     await ImagePicker.platform
                            //                         .pickImage(
                            //                             source:
                            //                                 ImageSource.camera),
                            //                 if (productController.image != null)
                            //                   {
                            //                     productController.productImage =
                            //                         File(productController
                            //                             .image!.path)
                            //                   }
                            //               },
                            //               child: Text('انتخاب از دوربین'),
                            //             ),
                            //             Divider(),
                            //             InkWell(
                            //               onTap: () async => {
                            //                 productController.image =
                            //                     await ImagePicker.platform
                            //                         .pickImage(
                            //                             source: ImageSource
                            //                                 .gallery),
                            //                 if (productController.image != null)
                            //                   {
                            //                     productController.productImage =
                            //                         File(productController
                            //                             .image!.path)
                            //                   }
                            //               },
                            //               child: Text('انتخاب از گالری'),
                            //             )
                            //           ],
                            //         ))),
                            //   )