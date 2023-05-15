import 'package:flutter/material.dart';
import 'package:myshop/core/constVariable.dart';
import 'package:myshop/widgets/custom_widgets/custom_product_items.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myshop/controllers/product_controller/products_controller.dart';
import 'package:get/get.dart';
import 'package:myshop/core/routes/routes.dart';

class AdminProductListVIew extends StatelessWidget {
  AdminProductListVIew({Key? key}) : super(key: key);
  ProductsController productController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => ListView.builder(
            itemCount: productController.productsList.length,
            itemBuilder: (context, index) => productController
                        .productsList.length !=  0 ?
                  CustomProductListItem(
                    widgetList: [
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                border: Border.all(
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                ConstaVariable.imageList![0],
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          productController.productsList[index].discount != 0
                              ? Positioned(
                                  top: 10,
                                  left: 10,
                                  child: badges.Badge(
                                    // position: badges.BadgePosition.topEnd(top: 10, end: 10),

                                    badgeStyle: badges.BadgeStyle(
                                        shape: badges.BadgeShape.instagram),
                                    //  elevation: 0,
                                    // position: BadgePosition.topEnd(),
                                    // padding: EdgeInsetsDirectional.only(end: 0),
                                    // badgeColor: Colors.transparent,
                                    badgeContent: Text(
                                        '${productController.productsList[index].discount} %'),
                                    // child: InkWell(child: Text('10%'),)
                                  ))
                              : SizedBox(),
                        ],
                      ),

                      // SizedBox(child: Image.asset(ConstaVariable.imageList![index],width: 100,height: 100,), ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: Icon(Icons.delete),
                                onTap: () => {
                                  productController.id.value = productController
                                      .productsList.value[index].id!,
                                  productController
                                      .showDialogTodeletProduct(context),
                                },
                              ),
                              InkWell(
                                child: Icon(Icons.edit),
                                onTap: () => {
                                  productController.setProductToedite(index),
                                  routeAdminAddProduct(
                                      productController.productModel)
                                },
                              ),
                            ],
                          ),
                          Row(children: [
                            Align(
                              child: Text('نام کتاب:'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(productController
                                .productsList.value[index].name!),
                            SizedBox(
                              height: 10,
                            )
                          ]),
                          Row(
                            children: [
                              Align(child: Text('قیمت:')),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(productController
                                              .productsList[index].discount
                                              .toString() !=
                                          0
                                      ? productController
                                          .calculateDiscount(index)
                                      : productController
                                          .productsList.value[index].price
                                          .toString()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  productController
                                              .productsList[index].discount !=
                                          0
                                      ? Text(
                                          productController
                                              .productsList.value[index].price
                                              .toString(),
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 10,
                                              color: Colors.red),
                                          textAlign: TextAlign.center,
                                        )
                                      : SizedBox(),
                                ],
                              ),
                              Text('تومان')
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Align(child: Text('توضیحات:')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(productController.productsList[index]
                                          .discription!.length >
                                      10
                                  ? productController
                                      .productsList[index].discription!
                                      .substring(0, 25)
                                  : productController
                                      .productsList[index].discription!)
                            ],
                          ),
                        ],
                      ),
                    ],
                  )

                // myimage: ConstaVariable.imageList![index],
                // introductionTxt: ConstaVariable.introductionTxtList![index],)

                : null)));
  }
}
