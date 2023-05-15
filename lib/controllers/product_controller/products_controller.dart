import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controllers/tag_controller/tags_controller.dart';
import 'package:myshop/models/product_model/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myshop/repositories/product_repository/product_repository.dart';
import 'package:myshop/widgets/custom_widgets/tag_dialog.dart';
import 'package:myshop/widgets/general_widgets/show_dialog.dart';
import 'package:myshop/core/routes/routes.dart';

class ProductsController extends GetxController {
  ProductRepository _repo = ProductRepository();

  PickedFile? image;
  RxString? base64Image = ''.obs;
  File? productImage;
  RxInt id = 0.obs;
  RxInt index = 0.obs;
  RxBool checkIfEditProductSelcted = false.obs;
  RxList<ProductModel> tagList = <ProductModel>[].obs;
  RxList<String> tagNameSelected = <String>[].obs;
  late TextEditingController? productNameController;
  late TextEditingController? productpriceController;
  late TextEditingController? productTotalCountController;
  late TextEditingController? productDiscountController;
  late TextEditingController? productDiscriptionController;
  RxList<ProductModel> productsList = <ProductModel>[].obs;
  ProductModel productModel = ProductModel();

  int? length;
  Future<void> addProduct(
      String image,
      String name,
      String discription,
      int price,
      int discount,
      List<String> tags,
      bool isAvilable,
      int totalCount,
      String category) async {
    final resultOrError = await _repo.getProducts();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<ProductModel> produts) {
      length = produts.length;

      addProducts(image, name, discription, price, discount, tags, isAvilable,
      totalCount, category);
      // productsList.value = [...produts];
      update();
    });

    update();
  }

  Future<void> addProducts(
      String image,
      String name,
      String discription,
      int price,
      int discount,
      List<String>? tags,
      bool isAvilable,
      int totalCount,
      String category) async {
    ProductModel products = ProductModel(
        discount: discount,
        name: name,
        discription: discription,
        price: price,
        tags: tags,
        isAvilable: isAvilable,
        totalCount: totalCount,
        category: category);
    final resultOrErrors = await _repo.addProducts(products);
    resultOrErrors.fold((left) {
      print('Left${left}');
    }, (ProductModel products) {
      productModel = products;
      // products;
      update();
    });

    final resultOrError = await _repo.getProducts();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<ProductModel> produts) {
      length = produts.length;

      productsList.value = [...produts];
      update();
    });

    update();
  }

  Future<void> getTotalProduct() async {
    final resultOrError = await _repo.getProducts();

    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<ProductModel> products) {
      productsList.value = [...products];
    });

    update();
  }

  Future<void> removeProduct() async {
    final resultOrError = await _repo.removeProduct(id.value);

    final resultOrErrors = await _repo.getProducts();
    resultOrErrors.fold((left) {
      print('Left${left}');
    }, (List<ProductModel> product) {
      productsList.value = [...product];

      update();
    });

    update();
  }

  Future<void> getProducts() async {
    final resultOrError = await _repo.getProducts();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<ProductModel> product) async {
      // length!.value =(tags.length)+1 ;
      productsList(product);
      product.map((e) => print(e));
      update();
    });
  }

  Future<void> editProduct() async {
    final resultOrError = await _repo.editedProduct(productModel, id.value);
    resultOrError.fold((left) {
      print('Left${left}');
    }, (ProductModel products) {
      getProducts();
      update();
      return products;
    });
    update();
  }

  String calculateDiscount(int index) {
    double discount = (productsList.value[index].price! *
            productsList.value[index].discount!) /
        100;
    double result = productsList.value[index].price! - discount;

    return result.toInt().toString();
  }

  void setProductToedite(int index) {
    id.value = productsList[index].id!;
    productModel = productsList[index];
    checkIfEditProductSelcted.value = true;
    this.index.value = index;
    productNameController!.text = productsList[index].name.toString();
    productDiscountController!.text = productsList[index].discount.toString();
    productDiscriptionController!.text =
        productsList[index].discription.toString();
    productpriceController!.text = productsList[index].price.toString();
    productTotalCountController!.text =
        productsList[index].totalCount.toString();
  }

  void showDialogTodeletProduct(BuildContext c) {
    showDialogMethode(
      heigth: 50,
      context: c,
      alerttitle: 'هشدار',
      cancellTxt: 'خیر',
      saveTxt: 'بله',
      widgetsItem: [Text('آیا از حذف محصول اطمینان دارید؟')],
      func1: () => {
        removeProduct(),
        // routetoAdminHomePage(c),
      },
      func2: () => {
        routetoAdminHomePage(c),
      },
    );
  }

  void showMultiSelectTag(
      BuildContext context, TagsController tagController) async {
    List<String>? items = [];
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        for (var i = 0; i < tagController.tagList.length; i++) {
          items.add(tagController.tagList[i].tagName!);
        }
        return MultiSelect(items: items);
      },
    );
  }

  void pickImageForProduct(ProductsController productController) async {
    productController.image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (productController.image != null) {
      productController.productImage = File(productController.image!.path);
    }
  }

  void clearProductController() {
    productNameController!.text = '';
    productpriceController!.text = '';
    productDiscriptionController!.text = '';
    productDiscountController!.text = '';
    productTotalCountController!.text = '';
  }

 void setEditeDataToDB() {
    productModel.name = productNameController!.text;
    productModel.discription = productDiscriptionController!.text;
    productModel.price = int.parse(productpriceController!.text);
    productModel.discount = int.parse(productDiscountController!.text);
    productModel.tags = tagNameSelected;
    productModel.isAvilable = true;
    productModel.totalCount = int.parse(productTotalCountController!.text);
    productModel.category = 'category';
  }

  @override
  void onInit() {
    getProducts();
    productDiscountController = TextEditingController();
    productDiscriptionController = TextEditingController();
    productNameController = TextEditingController();
    productTotalCountController = TextEditingController();
    productpriceController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    productDiscountController!.dispose();
    productDiscriptionController!.dispose();
    productNameController!.dispose();
    productTotalCountController!.dispose();
    productpriceController!.dispose();
    super.dispose();
  }
}
