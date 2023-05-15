import 'package:flutter/material.dart';
import 'package:myshop/pages/admin/admin_tag.dart';
  import 'package:myshop/widgets/custom_widgets/custom_product_items.dart';
 import 'package:myshop/controllers/tag_controller/tags_controller.dart';
 import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({this.tagList});
  List<String>? tagList;
  TagsController tagController = Get.find<TagsController>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var tags in tagController.listTagname) {
      if (tags.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(tags);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = tagController.listTagname[index];
        return CustomProductListItem(
          widgetList: [
            InkWell(
              child: Icon(Icons.edit),
              onTap: () => {
                tagController.setDateToediteTag(index),
                tagController.showDialogToToEditeTag(),
              },
            ),
            SizedBox(
              width: 10,
            ),

            InkWell(
              child: Icon(Icons.delete),
              onTap: () => {
                tagController.id.value = tagController.tagList.value[index].id!,
                tagController.removeTags(),
                Get.to(() => AdminTagView()),
              },
            ),

            SizedBox(
              width: 40,
            ),

            // Obx(() => Text(tagController.tagList.value[index].tagName.toString() )),
            Text(result),
          ],
        );
      },
      itemCount: tagController.listTagname.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var tags in tagController.listTagname) {
      if (tags.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(tags);
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return CustomProductListItem(
          widgetList: [
            InkWell(
              child: Icon(Icons.edit),
              onTap: () => {
                tagController.setDateToediteTag(index),
                tagController.showDialogToToEditeTag(),
              },
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () => {
                tagController.id.value = tagController.tagList.value[index].id!,
                tagController.removeTags(),
                Get.to(() => AdminTagView()),
              },
            ),
            SizedBox(
              width: 40,
            ),
            Text(result),
          ],
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
