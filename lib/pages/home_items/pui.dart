import 'package:flutter/material.dart';
import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../thanku_page.dart';


class registerPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _registerPage1();
}

class _registerPage1 extends State<registerPage1> {
   var errorMsg;
  String StripeToken='pk_test_51JPqrYSBtCOIyCFtizgVpjDQAibCuY983h4MYUGwrWRALR9RL2j9vsuhzW279LVCjfx8Aqt5cpPuUWcGeTaBqxSH00mRBRc4ax';
 String user_id='1';
String latitude='yes';
String longitude='yes';
  String ip='1212';
  static TextEditingController card_numberController = new TextEditingController();
static TextEditingController exp_monthController= new TextEditingController();
  static TextEditingController exp_yearController = new TextEditingController();
  static TextEditingController cvcController = new TextEditingController();
static TextEditingController amountController = new TextEditingController();
  static TextEditingController country_codeController = new TextEditingController();
  static TextEditingController country_nameController = new TextEditingController();
static TextEditingController cityController = new TextEditingController();
  static TextEditingController postalController = new TextEditingController();
  static TextEditingController latitudeController = new TextEditingController();
static TextEditingController longitudeController = new TextEditingController();
  static TextEditingController stateController = new TextEditingController();
  Registerr(String StripeToken,user_id,card,month,year,cvc,amount,countrycode,countryname,city,postal,latitude,longitude,ip,state) async {
       bool _isLoading = false;
  var errorMsg;
  
    String latitude='yes';
String longitude='yes';
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  
    Registerr(StripeToken,user_id,card_numberController.text,exp_monthController.text, exp_yearController .text,cvcController.text,amountController.text,country_codeController.text,
  country_nameController.text,cityController.text,postalController.text,latitude,longitude,ip,stateController.text);
                            // Register(nameController.text,emailController.text, passwordController.text);
                          //  Register(nameController.text,emailController.text, passwordController.text);
                         // },

  
//String StripeToken='pk_test_51JPqrYSBtCOIyCFtizgVpjDQAibCuY983h4MYUGwrWRALR9RL2j9vsuhzW279LVCjfx8Aqt5cpPuUWcGeTaBqxSH00mRBRc4ax';
//id=1;
//String latitude='yes';
//String longitude='yes';
 // double ip=1212;
   Map data = {
      'user_id':user_id,
     'StripeToken':StripeToken,
     'card_number':card,
     'exp_month':month,
     'exp_year':year,
     'cvc':cvc,
     'amount':amount,
     'country_code':countrycode,
     'country_name':countryname,
     'city':city,
     'postal':postal,
     'latitude':latitude,
     'longitude':longitude,


     'IPv4':ip,
     'state':state,

     
    };
   
    var jsonResponse = null;
    var token;  //
   // var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/registration'),headers: {"Accept": "application/json"}, body: data);
    //var response = await http.post("https://reqres.in/api/register", body: data);
    var response = await http.post(Uri.parse('https://www.flutter.fastrider.co/api/payment-by-stripe'),headers: {"Accept": "application/json"}, body: data);
  //https://www.flutter.fastrider.co/api/payment-by-stripe
    if(response.statusCode == 200) {
     // Get.to(LoginPage());
      Get.snackbar("Sucess", "payment Sucess");
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if(jsonResponse != null) {
        Center(
         child: CircularProgressIndicator());
      // setState(() {
         // _isLoading = false;
       // });
       //sharedPreferences.setString("email", jsonResponse['email']);
        Get.to(ThankYouPage());
      //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
      }
    }
    else {
    //  setState(() {
       // _isLoading = false;
    //  });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }


 

 // Register(card_numberController.text,exp_monthController.text, exp_yearController .text,cvcController.text,amountController.text,country_codeController.text,
 // country_nameController.text,cityController.text,postalController.text,stateController.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black12,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipPath(
                        clipper: TopWaveClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              Colors.red,
                              Colors.yellow,
                            ], begin: Alignment.topLeft, end: Alignment.center),
                          ),
                          height: MediaQuery.of(context).size.height / 5,
                        ),
                      ),
                    //  Image.asset(
                     //   'assets/burger.png',
                       // height: MediaQuery.of(context).size.height * 0.2,
                      //),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Stack(
                       
                        alignment: Alignment.bottomCenter,
                       //alignment: Alignment.topCenter,
                        children: <Widget>[

                          ClipPath(
                            clipper: FooterWaveClipper(),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: <Color>[
                                      Colors.blue,
                                      Colors.lightBlueAccent
                                    ],
                                    begin: Alignment.center,
                                    end: Alignment.bottomRight),
                              ),
                              height: MediaQuery.of(context).size.height / 3,
                            ),
                          ),

                         // Column(
                           ListView(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Text('Create Account',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),

                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 40, bottom:10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          controller:  card_numberController,
                                           decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Card Number",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(right: 40, bottom:10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                           
                                          keyboardType: TextInputType.emailAddress,
                                          controller: exp_monthController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Exp Month",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(right: 40, bottom: 5),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ),
                                       child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller:exp_yearController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Exp year",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              
                              Padding(
                                  padding: EdgeInsets.only(right: 40, bottom: 5),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ), child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: cvcController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Cvc",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),Padding(
                                  padding: EdgeInsets.only(right: 40, bottom: 5),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ), child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: amountController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "amount",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),Padding(
                                  padding: EdgeInsets.only(right: 40, bottom: 5),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ), child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: country_codeController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Country code",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                                  Padding(
                                  padding: EdgeInsets.only(right: 40, bottom: 5),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ), child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: country_nameController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Country name",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                  )),Padding(
                                  padding: EdgeInsets.only(right: 40, bottom: 5),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ), child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: stateController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "State",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                                  Padding(
                                  padding: EdgeInsets.only(right: 40, bottom: 5),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ), child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: cityController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "City",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(right: 40, bottom: 5),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: Material(
                                      elevation: 10,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular00),
                                          topRight: Radius.circular(35),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10, bottom: 10),
                                        child: TextField(
                                          obscureText: true,
                                          keyboardType: TextInputType.emailAddress,
                                          controller: postalController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "postal",
                                            labelStyle: TextStyle(
                                                color: Colors.black45, fontSize: 14),
                                            // hintText: "Email",
                                            // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),

       

                             // SizedBox(height: 10,),
                              //roundedRectButton('Register Now',[    Colors.pink,
                               // Colors.amber,]),

                            ],
                          ),
                        ],
                      )
                  ),


                  SizedBox(height: 20,),
                  ElevatedButton(   onPressed: () {
                   Registerr(StripeToken,user_id,card_numberController.text,exp_monthController.text, exp_yearController .text,cvcController.text,amountController.text,country_codeController.text,
  country_nameController.text,cityController.text,postalController.text,latitude,longitude,ip,stateController.text);
                  
                  
                  
                  
               //   , child:Text('pay'))

              // onPressed: () {
                           //  Register());
                          //  Register(nameController.text,emailController.text, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                  top: 16.w,
                                  bottom: 16.w)),
                          child: Text(
                            "Pay",
                            style: GoogleFonts.lato(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                 // roundedRectButton('pAY',[    Colors.pink,
                                //Colors.amber,]),

                            ],
                            
                             //Register(StripeToken,user_id,card_numberController.text,exp_monthController.text, exp_yearController .text,cvcController.text,amountController.text,country_codeController.text,
 // country_nameController.text,cityController.text,postalController.text,latitude,longitude,ip,stateController.text);
                            // Register(nameController.text,emailController.text, passwordController.text);
                          //  Register(nameController.text,emailController.text, passwordController.text);
                         // },
                         
                          ),
                  //RichText(text: TextSpan(text: 'Already have an account? ',
                     // style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      //children: <TextSpan>[

                       // new TextSpan(
                          //  text: 'Login',
                            //style: new TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline,color: Colors.red)),

        )));//]);
                //  );
               // ],
             // )),
        //));                    
  }

}
 Register(String StripeToken,user_id,card,month,year,cvc,amount,countrycode,countryname,city,postal,latitude,longitude,ip,state) async {
       bool _isLoading = false;
  var errorMsg;
  
    
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  
  
//String StripeToken='pk_test_51JPqrYSBtCOIyCFtizgVpjDQAibCuY983h4MYUGwrWRALR9RL2j9vsuhzW279LVCjfx8Aqt5cpPuUWcGeTaBqxSH00mRBRc4ax';
//id=1;
String latitude='yes';
String longitude='yes';
 // double ip=1212;
   Map data = {
      'user_id':user_id,
     'StripeToken':StripeToken,
     'card_number':card,
     'exp_month':month,
     'exp_year':year,
     'cvc':cvc,
     'amount':amount,
     'country_code':countrycode,
     'country_name':countryname,
     'city':city,
     'postal':postal,
     'latitude':latitude,
     'longitude':longitude,


     'IPv4':ip,
     'state':state,

     
    };
   
    var jsonResponse = null;
    var token;  //
   // var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/registration'),headers: {"Accept": "application/json"}, body: data);
    //var response = await http.post("https://reqres.in/api/register", body: data);
    var response = await http.post(Uri.parse('https://www.flutter.fastrider.co/api/payment-by-stripe'),headers: {"Accept": "application/json"}, body: data);
  //https://www.flutter.fastrider.co/api/payment-by-stripe
    if(response.statusCode == 200) {
     // Get.to(LoginPage());
      Get.snackbar("Sucess", "payment Sucess");
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if(jsonResponse != null) {
        Center(
         child: CircularProgressIndicator());
      // setState(() {
         // _isLoading = false;
       // });
       //sharedPreferences.setString("email", jsonResponse['email']);
        //Get.to(ThankYouPage());
      //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
      }
    }
    else {
    //  setState(() {
       // _isLoading = false;
    //  });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }





Widget roundedRectButton(
    String title, List<Color> gradient ) {
  return Builder(builder: (BuildContext mContext) {
    return InkWell(
     
       onTap: () {
         
          // Register(StripeToken,user_id,card_numberController.text,exp_monthController.text, exp_yearController .text,cvcController.text,amountController.text,country_codeController.text,
 // country_nameController.text,cityController.text,postalController.text,latitude,longitude,ip,stateController.text);
                            // Register(nameController.text,emailController.text, passwordController.text);
                          //  Register(nameController.text,emailController.text, passwordController.text);
                         // },
       },                    
      splashColor: Colors.lightBlue,
      child:  Container(
        alignment: Alignment.center,
        height: MediaQuery.of(mContext).size.height * 0.05,
        width: MediaQuery.of(mContext).size.width / 3,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Text(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ),
    );
  });
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
    Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

  