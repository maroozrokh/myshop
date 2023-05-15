import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myshop/pages/admin/admin_page.dart';
import 'package:myshop/core/http_backend/http_config.dart';
import 'package:myshop/core/extention_class.dart';
import 'package:myshop/models/user_model/users.dart';
import 'package:myshop/repositories/user_repository/user_repository.dart';
import 'package:myshop/widgets/general_widgets/show_snackbar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegistrationController extends GetxController {
  UserRepository _userRepo = UserRepository();
   TextEditingController usenamecontroller = TextEditingController();
  late TextEditingController phonecontroller;
  late TextEditingController addresscontroller;
  RxBool checkLogPage = true.obs;
  Users usersModel = Users();
  RxList<Users> userList = <Users>[].obs;
  RxInt userId = 0.obs;
  RxBool logInforProfile = false.obs;
  PickedFile? image;
  File? userImage;

  Future<void> getUser(
      {String? username,
      String? phone,
      String? address,
      BuildContext? context,
      String? image}) async {
    final resultOrError = await _userRepo.getUser();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<Users> users) {
      userList.value = [...users];

      for (int i = 0; i < users.length; i++) {
        if (users[i].username == username && users[i].phone == phone) {
          switch (users[i].role) {
            case 1:
              userId.value = users[i].id!;
              usersModel = users[i];
              addresscontroller.text = users[i].address!;
              userList.value = [...users];

              print("11");
              print(usersModel);
              Get.off(AdminPageView(userModel: usersModel));
              return users;

              break;

            case 2:
              userId.value = users[i].id!;
              usersModel = users[i];
              userList.value = [...users];

              addresscontroller.text = users[i].address!;
              print("12");
              print(usersModel);
              // Get.off(IntroductionPage());
              return users;
              break;
          }

          break;
        } else {
          ShowSnackBar.showSnackBar(
              context!, 'اگر حساب کاربری ندارید ثبت نام کنید');
          break;
        }
      }
    });
  }

  Future<void> checkDuplicateUser(
      {String? username,
      String? phone,
      String? address,
      String? image,
      BuildContext? context}) async {
    final resultOrError = await _userRepo.getUser();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<Users> users) {
      userList.value = [...users];
      print(userList);

      for (int i = 0; i < users.length; i++) {
        if (users[i].phone != phone) {
          // if(i+1 == users.length){
          addUsers(
              username: usenamecontroller.text.toString(),
              phone: phonecontroller.text.toString(),
              image: "",
              role: 2,
              address: addresscontroller.text.toString());
          ShowSnackBar.showSnackBar(context!, 'ثبت نام شما با موفقیت ثبت شد!');
          userId.value = users[i].id!;
          usersModel = users[i];

          break;
          // }
        } else {
          ShowSnackBar.showSnackBar(
              context!, 'قبلا کاربری با این شماره تلفن ثبت نام کرده است!');
          break;
        }
      }
    });
  }

  Future<void> addUsers(
      {String? username,
      String? phone,
      String? image,
      int? role,
      String? address}) async {
    Users users = Users(
        username: username,
        phone: phone,
        image: image,
        role: role,
        address: address);
    final resultOrError = await _userRepo.addUsers(users);
    resultOrError.fold((left) {
      print('Left${left}');
    }, (Users users) {
      usersModel = users;
      users;
    });
  }

  Future<void> findUser() async {
    final resultOrError = await _userRepo.getUser();
    resultOrError.fold((left) {
      print('Left${left}');
    }, (List<Users> users) {
      for (int i = 0; i < users.length; i++) {
        if (users[i].id == userId.value) {
          usersModel = users[i];
        }
      }
    });
  }

  validatePhoneNumber(String value) {
    if ((!value.isValidPhone) || value.isEmpty) {
      return 'شماره تلفن معتبر نیست';
    }
  }

  validateUseName(String value) {
    if ((!value.isValidName) || value.isEmpty) {
      return 'نام کاربری معتبر نیست';
    }
  }

  loginValidation(GlobalKey<FormState> formKey, BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (checkLogPage.value) {
        checkDuplicateUser(
            username: usenamecontroller.text,
            phone: phonecontroller.text,
            context: context,
            image: "",
            address: addresscontroller.text);
        findUser();
      } else {
        getUser(
            username: usenamecontroller.text.toString(),
            phone: phonecontroller.text.toString(),
            address: addresscontroller.text.toString(),
            image: "",
            context: context);
        findUser();
      }
    }
  }

  void checkBooltoLoginOrregister() {
    if (checkLogPage.isTrue) {
      checkLogPage.value = false;
    } else {
      checkLogPage.value = true;
    }
  }

  Future<void> editUser() async {
    final resultOrError = await _userRepo.editedUser(usersModel, userId.value);
    resultOrError.fold((left) {
      print('Left${left}');
    }, (Users user) {
      return user;
    });
    update();
  }

  clearUserController() {
    usenamecontroller.text = '';
    phonecontroller.text = '';
    addresscontroller.text = '';
  }

  void pickImageForUser(RegistrationController userController) async {
    userController.image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (userController.image != null) {
      userController.userImage = File(userController.image!.path);
    }
  }

  void setDataToEditeUser() {
    usersModel.address = addresscontroller.text;
    usersModel.phone = phonecontroller.text;
    usersModel.username = usenamecontroller.text;
  }

  @override
  void onInit() {
    usenamecontroller = TextEditingController();
    phonecontroller = TextEditingController();
    addresscontroller = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    usenamecontroller.dispose();
    phonecontroller.dispose();
    addresscontroller.dispose();
    super.dispose();
  }
}
