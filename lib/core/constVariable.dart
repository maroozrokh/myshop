import 'dart:ui';

import 'package:myshop/pages/admin/admin_add_product.dart';
import 'package:myshop/pages/admin/admin_products.dart';
import 'package:myshop/pages/admin/admin_profile.dart';
import 'package:myshop/pages/admin/admin_tag.dart';

class ConstaVariable{





    static List<String>? imageList = ['assets/images/readbook3.png','assets/images/readbook2.png'];
    static List<String>? introductionTxtList = [' به طاقچه خوش آمدی می تونی بیش از 80 هزار کتاب رو از بخری','تمام تلاشمون رو می کنیم تا از خواندن کتاب ها لذت ببری'];
    static List<String>? productName = [' کیمیاگر','صد سال تنهایی','ملت عشق','باشگاه پنج صبحی ها','جنگجوی عشق'];
    static List<int>? productDiscount = [10,20,30,10,5];
    static List<int>? productPrice = [35000,44000,65000,34000,44000];
    static List<int>? productPriceSale = [25000,34000,55000,24000,34000];
    static List<String>? productDiscription= ['نویسنده: پائلو کوئلو   داستانی تخیلی همراه با امید و آرزو داستانی سرشار از رویاپردازی و تلاش برای به دست آردن کنچجی پنهان',
    'نویسند: گابریل گارسیا مارکز   داستان زندگینامه ی صد ساله ی خانواده ی روسی در جنگ ',
    'نویسند: گابریل گارسیا مارکز   داستان زندگینامه ی صد ساله ی خانواده ی روسی در جنگ ',
    'نویسند: گابریل گارسیا مارکز   داستان زندگینامه ی صد ساله ی خانواده ی روسی در جنگ ',
    
    
    
    
    
    
    ];



  static int pageIndex = 0;
  
 static final  pages = [
      AdminProfieView(),
      AdminProductListVIew(),
      AdminTagView(),
     AdminAddProductView(),
  ];



static Color kblue = Color(0xFF4756DF);
static Color kwhite = Color(0xFFFFFFFF);
static Color whiteappbar = Color.fromARGB(255, 251, 251, 251);
static Color kblack = Color(0xFF000000);
static Color kbrown300 = Color(0xFF8D6E63);
static Color kbrown = Color(0xFF795548);
static Color kgrey = Color(0xFFC0C0C0);

}
