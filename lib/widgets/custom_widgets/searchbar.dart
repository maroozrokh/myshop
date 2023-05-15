import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/core/constVariable.dart';
import 'package:myshop/controllers/tag_controller/tags_controller.dart';
import 'package:get/get.dart';
class CustomBarWidget extends StatelessWidget {
  CustomBarWidget({super.key ,this.myController,this.onPress, this.onChanged,this.value});

      // GlobalKey<Scaffold> _scaffoldKey = GlobalKey();
      TextEditingController? myController;
    final  Function()? onPress;
    final Function()? onChanged;
    String? value;
   TagsController tagController = Get.find<TagsController>();

      @override
      Widget build(BuildContext context) {
        Get.put(TagsController);
        return  
          // key: _scaffoldKey,
          Container(
            height: 160.0,
            child: Stack(
              children: <Widget>[
                Container(
                  color: ConstaVariable.kblue,
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "کتابخون",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
            
                Positioned(
                  top: 80.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                  
                          Expanded(
                            child: 
                            TextField(
                              controller: myController,
                              onChanged: (value) => {
                                print(value),
                                tagController.searchTags(value)

                              },
                              decoration: InputDecoration(
                                hintText: "جستجو",
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: ConstaVariable.kblue,
                            ),
                            onPressed: () {
                              onPress;
                              print("search");
                            },
                          ),
                     
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          

      );}

}