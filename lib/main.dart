import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controllers/home_controller/home_controller.dart';
import 'package:myshop/pages/onboard/onboard.dart';
import 'package:myshop/controllers/product_controller/products_controller.dart';
import 'package:myshop/controllers/registration_controller/registration_controller.dart';
import 'package:myshop/pages/share_page/registration_page.dart';
import 'package:myshop/controllers/tag_controller/tags_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegistrationController());
    Get.put(ProductsController());
    Get.put(TagsController());
    Get.put(HomeController());
    return GetMaterialApp(
      // translations: AppTranslations.translations,
      // translations: LocolizedServices(),
      // locale: Locale('fa_IR'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,

      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   scaffoldBackgroundColor: Colors.white
      // ),
      // darkTheme: ThemeData(scaffoldBackgroundColor: Colors.amberAccent),
      // home: isviewed != 0 ?   OnBoard() : RegistrationPage(),
      home: RegistOrLogInPage(),
    );
  }
}
