import 'package:dean_institute_mobile_app/pages/home_page.dart';
import 'package:dean_institute_mobile_app/pages/profile_pages/payment_history.dart';
import 'package:dean_institute_mobile_app/pages/profile_pages/update_profile.dart';
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:dean_institute_mobile_app/ui/splash/welcome_page.dart';
import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:dean_institute_mobile_app/widgets/custom_divider.dart';
import 'package:dean_institute_mobile_app/widgets/custom_row_tile.dart';
import 'package:dean_institute_mobile_app/widgets/custom_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';

import '../profile_pages/payment_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
 // const Profile({Key? key}) : super(key: key);
  
 // void _onLogOutPressed() {
   ///// onPressed: ()
   // async {
         //   SharedPreferences prefs = await SharedPreferences.getInstance();
          //  prefs.remove('email');
          //  Navigator.pushReplacement(context,
            //    MaterialPageRoute(builder: (BuildContext ctx) => Login()));
       //   },
   // void logoutUser(){
//SharedPreferences prefs = await SharedPreferences.getInstance();
//prefs?.clear() ;
// Navigator.pushAndRemoveUntil(
     // context, 
      //ModalRoute.withName("/SplashScreen"), 
     //ModalRoute.withName("/Home")
  //  );

   // print("Log out");
 // }

  @override
  
  //final HomePage c = Get.put(HomePage());
 // var email = HomePage.vae;
          // c.localStorage.readAll();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, right: 22.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTopAppBar(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  title: "Profile",
                  trailing: TextButton( onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            //  prefs.get('email');
            
           final LoginPage c = Get.put(LoginPage());
           c.localStorage.readAll();
            c. localStorage.deleteAll();
          
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
           Get.snackbar(
              "Logout",
               "Bye Bye everyone",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.red,
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
               dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
          },
                    //onPressed:
                    
                    // _onLogOutPressed,


                    child: Text(
                      "Log out",
                      style: GoogleFonts.lato(
                          fontSize: 20.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
   
            
            //  prefs.get('email');
                 CircleAvatar(
              radius: 50,
            backgroundColor:Colors.cyan,
             // backgroundImage: I
            ),
              Text(//HomePage.vae"
             "" ,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Pacifico',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
               // color: Colors.teal[100]
                color: Colors.black,
              ),
            ),
            Text(
              'COMPUTER SCIENCE ENGINEER',
              style: TextStyle(
                fontFamily: 'SourceSans',
               // color: Colors.teal[100],
               color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(
              height:20,
              width: 150,
              child: (
                  Divider(
                    color: Colors.teal.shade100,
                  )
              ),
              
              ),
Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
          
                  "+91 8919353233",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SourceSans',
              
                  ),
                ),
              )
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                selected: true,
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
              
               //  SharedPreferences prefs = await SharedPreferences.getInstance();
           // prefs.remove('email');
                title: Text(//HomePage.vae,//email,
"venkatandroid10@gmail.com",
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'SourceSans',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
              
        ],
      ),
         ), ),));
     }
}
