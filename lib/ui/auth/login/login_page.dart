
import 'package:dean_institute_mobile_app/ui/auth/login/login_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dean_institute_mobile_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FlutterSecureStorage localStorage = new FlutterSecureStorage();
   

 /// _login() {
    //controller.loginUser(, password);
  //}
 j(){
 FlutterSecureStorage localStorage = new FlutterSecureStorage();
     localStorage.write(key: "email", value: "email").obs;
      var k=localStorage.read(key: "email").obs;

     }
 // @override
 void post(){
   j();
    bool _isLoading = false;
  var errorMsg;
  Register(String  email, pass,) async {
    FlutterSecureStorage _localStorage = new FlutterSecureStorage();
     await _localStorage.write(key: "email", value: "email").obs;
     
// SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      
      'email': email,
      'password': pass
    };
    var jsonResponse = null;
  //Uri('https://reqres.in/api/register');
    var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/login'), body: data);
    if(response.statusCode == 200) {
       
     Get.to(HomePage(),arguments:email);
      jsonResponse = json.decode(response.body);
      print(jsonResponse); 
       // Get.snackbar("Sucess", "Login Sucess");
       Get.snackbar(
              "Sucessful Login",
               "Hello everyone",
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
      print("sucess");
      //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
       //Get.to(HomePage());
     //if(jsonResponse != null) {
     //   setState(() {
        //  _isLoading = false;
      // });
     //   sharedPreferences.setString("token", jsonResponse['token']);
       // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route<dynamic> route) => false);
    ///  GetPage(
         //  name: "/",
          // page: () => HomePage();
           // Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginPage()),
           // );
            // page: () => LoginPage(),
          //);
     // }
    }
    else {
     // setState(() {
     //   _isLoading = false;
     // });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
      print("nooo");
    }
  }
  Register(emailController.text, passwordController.text);
 }

  void postt(){Register(String email, pass) async {
    j();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FlutterSecureStorage _localStorage = new FlutterSecureStorage();
    Map data = {
      'email': email,
      'password': pass
    }; 
    await _localStorage.write(key: "email", value: "email");
    var jsonResponse = null;
    var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/login'), body: data);
    if(response.statusCode == 200) {
      Get.to(HomePage());
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
       print(jsonResponse);  
      print("sucess");
      if(jsonResponse != null) {
      //  setState(() {
        // _isLoading = false;
       // });
        sharedPreferences.setString("token", jsonResponse['token']);
      //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
      }
    }
    else {
     // setState(() {
        //_isLoading = false;
     // });
     // errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(36.w),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset("assets/images/logo_with_text.png"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   
                        // controller: emailController,
                        
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        // controller: emailController,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                       controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     //   CheckBoxWithTitle(),
                        ElevatedButton(
                          onPressed: () { 
     
                          
          
                            post();
                          //  Register(nameController.text,emailController.text, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                  top: 16.w,
                                  bottom: 16.w)),
                          child: Text(
                            "logn in",
                            style: GoogleFonts.lato(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                           
                            ),


                            
                          
                         ),
                        ),

                         TextButton(
                            onPressed: () {
                              Get.toNamed("/signUp");
                            },
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.lato(fontSize: 12.sp),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}

