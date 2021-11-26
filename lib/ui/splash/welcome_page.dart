import 'package:dean_institute_mobile_app/utility/constants.dart' as constants;
import 'package:dean_institute_mobile_app/widgets/blur_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:dean_institute_mobile_app/pages/home_page.dart';
import 'package:http/http.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    navigateToAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.base_red_color,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UpperHalf(),
              LowerHalf(),
            ],
          ),
          Positioned(
            bottom:
                MediaQuery.of(context).size.aspectRatio < 0.7 ? 398.h : 370.h,
            left: 137.28.w,
            child: SizedBox(
              width: 84.w,
              height: 88.w,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset("assets/images/logo_main.png"),
              ),
            ),
          )
        ],
      ),
    );
  }

  void navigateToAuth() async {
     FlutterSecureStorage _localStorage = new FlutterSecureStorage();
     await _localStorage.write(key: "email", value: "email");
 // final  LoginPage = new LoginPage();
  final LoginPage c = Get.put(LoginPage());
 // c.post();
    await Future.delayed(Duration(seconds: 3), () {});
if(c.localStorage.isBlank==true){
  
      Get.offNamed("/login");
   //Get.offNamed("/signup");
}
else{
//print("no");
  // Get.offNamed("");
   Get.to(HomePage());
  }
}}

class LowerHalf extends StatelessWidget {
  const LowerHalf({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 77.h,
          ),
          Container(
            height: 94.h,
            width: 178.w,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Dean Institute",
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "&",
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "Fellowship",
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            height: 42.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "We believe everyone has the capacity  to be creative.",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          Text(
            "Campus / Online",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}

class UpperHalf extends StatelessWidget {
  const UpperHalf({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 278.h,
      width: 360.w,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset("assets/images/main_bg.png"),
            ),
          ),
          SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "WELCOME TO",
                  style: GoogleFonts.poppins(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 4.sp,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BlurCardContainer(
                      imagePath: "assets/images/star_image.png",
                      tileText: "Best Industry Leaders",
                    ),
                    BlurCardContainer(
                      imagePath: "assets/images/book_stack.png",
                      tileText: "High School Diploma",
                    ),
                  ],
                ),
                SizedBox(
                  height: 19.h,
                ),
                BlurCardContainer(
                  imagePath: "assets/images/open_book.png",
                  tileText: "Learn Courses Online",
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
