
import 'package:flutter/material.dart';
import 'package:myshop/controllers/product_controller/products_controller.dart';
import 'package:get/get.dart';

class MultiSelect extends StatefulWidget {

  MultiSelect({Key? key, required this.items}) : super(key: key);
  final List<String> items;

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
     ProductsController productController = Get.find<ProductsController>();

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        productController.tagNameSelected.add(itemValue);
        print( productController.tagNameSelected);
      } else {
         productController.tagNameSelected.remove(itemValue);
          print( productController.tagNameSelected);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, productController.tagNameSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('انتخاب تگ'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: productController.tagNameSelected.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('بیخیال'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('ثبت'),
        ),
      ],
    );
  }
}

