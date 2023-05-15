
import 'package:flutter/material.dart';
import 'package:myshop/widgets/custom_widgets/custom_button_container.dart';
 import 'package:myshop/models/onboard_model/onboard_model.dart';
import 'package:myshop/pages/share_page/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constVariable.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;

  late PageController _pageController;

  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/readbook2.png',
      text: "به کتابخون خوش اومدی",
      desc:
          "می تونی بیش از 80 هزار کتاب رو بخری",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/readbook2.png',
      text: "با کتابخون راحت کتاب رو دم در خونت تحویل بگیر",
      desc:
          "تمام تلاشمان را می کنیم تا از خواندن کتاب ها لذت ببری",
      bg: Color(0xFF4756DF),
      button: Colors.white,
    ),

  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: currentIndex % 2 == 0 ? ConstaVariable.kwhite : ConstaVariable.kblue,
      appBar: AppBar(
        backgroundColor: currentIndex % 2 == 0 ?ConstaVariable. kwhite : ConstaVariable.kblue,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardInfo();
              // Navigator.pushReplacement(
                  // context, MaterialPageRoute(builder: (context) => IntroductionPage()));
            },
            child: Text(
              "رد کن",
              style: TextStyle(
                color: currentIndex % 2 == 0 ? ConstaVariable.kblack : ConstaVariable.kwhite,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            // physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(screens[index].img),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 20 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? ConstaVariable.kbrown
                                      : ConstaVariable.kbrown300,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: index % 2 == 0 ? ConstaVariable.kblack : ConstaVariable.kwhite,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      color: index % 2 == 0 ? ConstaVariable.kblack : ConstaVariable.kwhite,
                    ),
                  ),
                  index % 2 == 0 ? 
                 CustomBtnContainer(
                      onTap: ()async{
                        if (index == screens.length - 1) {
                        await _storeOnboardInfo();
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) => IntroductionPage()));
                      }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 10),
                        curve: Curves.bounceIn,
                      );

                      },
                      colorBtn: index % 2 == 0 ? ConstaVariable.kblue : ConstaVariable.kwhite,
                      textBtn:   "بعدی",
                      height: 30,
                      weigth: 10,
                      colorTxtBtn: index % 2 == 0 ? ConstaVariable.kwhite : ConstaVariable.kblue,
                      iconBtn: Icons.arrow_forward_sharp,
                      colorIconBtn: index % 2 == 0 ? ConstaVariable.kwhite : ConstaVariable.kblue,
                      ) : 
      
              Column(
                children: [
           
                    CustomBtnContainer(
                      onTap: ()async{
                        if (index == screens.length - 1) {
                        await _storeOnboardInfo();
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) => IntroductionPage()));
                      }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 10),
                        curve: Curves.bounceIn,
                      );

                      },
                      colorBtn: index % 2 == 0 ? ConstaVariable.kblue : ConstaVariable.kwhite,
                      textBtn:   "ثبت نام",
                      height: 30,
                      weigth: 10,
                      colorTxtBtn: index % 2 == 0 ? ConstaVariable.kwhite : ConstaVariable.kblue,
                      iconBtn: Icons.arrow_forward_sharp,
                      colorIconBtn: index % 2 == 0 ? ConstaVariable.kwhite : ConstaVariable.kblue,
                      ),
                      
                 
                    ],
                          ),

               InkWell(
                    onTap: () async {
                      if (index == screens.length - 1) {
                        await _storeOnboardInfo();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => RegistOrLogInPage()));
                      }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Text('قبلا ثبت نام کردم', style: TextStyle(
                              fontSize: 16.0,
                              color:  ConstaVariable.kwhite),),
                    
              ),

       
        ]);
            })
      ),
    );
  }
}