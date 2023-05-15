import 'dart:io';
import 'dart:math';
 import 'package:myshop/pages/admin/admin_tag.dart';
 import 'package:myshop/widgets/custom_widgets/custom_textfield.dart';
import 'package:myshop/core/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'package:image_picker/image_picker.dart';
import 'package:myshop/models/tag_model/tags_model.dart';
 import 'package:shared_preferences/shared_preferences.dart';
import 'package:myshop/repositories/tag_repository/tag_repository.dart';
import 'package:myshop/widgets/general_widgets/show_dialog.dart';

class TagsController extends GetxController {
  TagRepository _repo = TagRepository();
  RxList<TagsModel> tagList = <TagsModel>[].obs;
  TagsModel tagsModel = TagsModel();
  List<String> listTagname = [];

  late TextEditingController tagController = TextEditingController();
  late TextEditingController editeTageController = TextEditingController();

  RxInt length = 0.obs;
  int? lengthList = 0;
  RxInt id = 0.obs;
  RxInt index = 0.obs;

  Future<void> addTags(String name) async {
    TagsModel tags = TagsModel(tagName: name, isDeletedTag: false);
    final resultOrErrors = await _repo.addTags(tags);
    resultOrErrors.fold((left) {
      print('Lefts${left}');
    }, (TagsModel tags) async {
      tags;
      update();
    });

    final resultOrError = await _repo.getTags();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<TagsModel> tags) {
      tagList.value = [...tags];
      update();
      plusTagLength();
    });

    update();
  }

  Future<void> addTagWithoudDuplicated(String name) async {
    final resultOrError = await _repo.getTags();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<TagsModel> tags) async {
      addTags(name);
      tagList.value = [...tags];

      print(' tags length is : ${tags.length}');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('saveLength', tags.length + 1);
      lengthList = prefs.getInt('saveLength');

      update();
    });
    update();
  }

  Future<void> searchItemTags() async {
    final resultOrError = await _repo.getTags();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<TagsModel> tags) async {
      tagList.value = [...tags];
      listTagname.clear();
      for (var i = 0; i < tags.length; i++) {
        listTagname.add(tagList.value[i].tagName!);
      }
    });
  }

  Future<void> getTags() async {
    final resultOrError = await _repo.getTags();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<TagsModel> tags) async {
      length!.value = (tags.length) + 1;
      tagList.value = [...tags];
      tags.map((e) => print(e));
      update();
    });
  }

  // Future<void> getTagsLength() async {
  //   final resultOrError = await _repo.getTags();
  //   resultOrError.fold((left) {
  //     print('Left${left}');
  //   }, (List<TagsModel> tags) {
  //     length.value = tags.length;
  //     print(tags.length);
  //   });
  // }

  Future<void> removeTags() async {
    final resultOrError = await _repo.removeTags(id.value);

    final resultOrErrors = await _repo.getTags();
    resultOrErrors.fold((left) {
      print('Left${left}');
    }, (List<TagsModel> tags) {
      tagList.value = [...tags];

      listTagname.clear();
      for (var i = 0; i < tags.length; i++) {
        listTagname.add(tagList.value[i].tagName!);
        update();
      }
    });

    update();
  }

  // Future<void> edietTagss(TagsModel tagsModel) async {
  //   final resultOrErrors =
  //       await _repo.editTagss(id: id.value, tagsModel: tagList[index.value]);
  //   update();
  // }

  Future<void> editTagsss() async {
    final resultOrError = await _repo.editeTagsss(tagsModel, id.value);
    resultOrError.fold((left) {
      print('Left${left}');
    }, (TagsModel tags) {
      getTags();
      update();
      return tags;
    });
    update();
  }

  Future<void> searchTags(String tagsSearch) async {
    final resultOrError = await _repo.getTags();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<TagsModel> tags) async {
      for (int i = 0; i < tags.length; i++) {
        for (int j = i; j < tags[i].tagName!.length; j++) {
          for (int t = j; t < tagsSearch.length; t++) {
            if (tags[i].tagName![t] == tagsSearch[t]) {
              print('hi0');
            }
          }
        }
      }
    });
  }

  void plusTagLength() async {
    length++;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('saveLength', length.value);
    update();
  }

  void showDialogToToEditeTag() {
    showDialogMethode(
        heigth: 100,
        context: Get.context!,
        alerttitle: 'هشدار',
        cancellTxt: 'بیخیال',
        saveTxt: 'ذخیره',
        widgetsItem: [
          CustomTextField(
            hintText: "ویراش تگ",
            labelTxt: "ویرایش تگ",
            myController: editeTageController,
          )
        ],
        func1: () => {
              tagsModel.tagName = editeTageController.text,
              tagsModel.isDeletedTag = false,
              editTagsss(),
              editeTageController.text = '',

              Get.off (AdminTagView())     ,
              // Get.to(()=>AdminPageView())     ,
            },
        func2: () => {Get.off(AdminTagView())},
        values: tagsModel.tagName);
  }

  void setDateToediteTag(int indexs) {
    id.value = tagList.value[indexs].id!;
    index.value = indexs;
    tagsModel = tagList.value[indexs];
    editeTageController.text = tagList.value[indexs].tagName.toString();
  }

  @override
  void onInit() async {
    getTags();
    searchItemTags();
    tagController = TextEditingController();
    editeTageController = TextEditingController();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lengthList = prefs.getInt('saveLength');
    super.onInit();
  }

  @override
  void dispose() {
    tagController.dispose();
    editeTageController.dispose();
    super.dispose();
  }
}
