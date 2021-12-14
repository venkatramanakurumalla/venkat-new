import 'package:dean_institute_mobile_app/utility/constants.dart' as constants;
import 'package:dean_institute_mobile_app/widgets/blur_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:splashscreen/splashscreen.dart';


import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:dean_institute_mobile_app/pages/home_page.dart';
import 'package:http/http.dart';

class WelcomeePage extends StatefulWidget {
  const WelcomeePage({Key? key}) : super(key: key);

  @override
  _WelcomeePageState createState() => _WelcomeePageState();
}

class _WelcomeePageState extends State<WelcomeePage> {
  @override
  void initState() {
    super.initState();
    navigateToAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.base_red_color,
      body: //Stack(
        //children: [
         // Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.center,
           // children: [
              Splash2(),
            //  UpperHalf(),
             // LowerHalf(),
            //],
        //  ),
         
      );
   // );
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
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return 
    return new Scaffold(
  body: new Image.network(
   "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80",
    //"https://cdn.pixabay.com/photo/2017/02/21/21/13/unicorn-2087450_1280.png",
    // new Image.asset('"assets/images/jp.jpg"',//),
    fit: BoxFit.cover,
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
  ),
);//SplashScreen(
     // seconds: 6,
     // navigateAfterSeconds: new SecondScreen(),
     // title: new Text('GeeksForGeeks',textScaleFactor: 2,),
   // child:  image: new Image.asset('"assets/images/jp.jpg"'),
     // loadingText: Text("Loading"),
     // photoSize: 100.0,
      //loaderColor: Colors.blue,
    //);
  }
}
