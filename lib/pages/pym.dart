import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
//import 'package:moneycash/constants/constants.dart';
//import 'package:moneycash/ui/signin.dart';
//import 'package:moneycash/ui/widgets/responsive_ui.dart';
//import 'package:moneycash/ui/widgets/textformfield.dart';
//import 'package:moneycash/utils/widgets.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  TextEditingController firstName = new TextEditingController();
  TextEditingController emailreg = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  TextEditingController paypalid = new TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    //_large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    //_medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 60)),
                Image.asset(
                  "assets/images/logo.jpeg",
                  height: 150,
                ),
                form(),
                SizedBox(
                  height: _height / 35,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                  //  children: [button('Sign-Up', getRegistration)],
                  ),
                ),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
            SizedBox(height: _height / 60.0),
            confirmPasswordTextFormField(),
            SizedBox(height: _height / 60.0),
            payPalTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return TextFormField(
      controller: firstName,
      keyboardType: TextInputType.text,
      autofocus: false,
     // decoration: buildInputDecoration('Full Name', Icons.person),
      validator: (value) => value!.isEmpty ? "Please enter name" : null,
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      controller: emailreg,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //decoration: buildInputDecoration('E-mail', Icons.email),
      validator: (value) => value!.isEmpty ? "Please enter Email" : null,
    );
  }

  Widget phoneTextFormField() {
    return TextFormField(
      controller: mobile,
      keyboardType: TextInputType.number,
      autofocus: false,
     // decoration: buildInputDecoration('Mobile Number', Icons.phone),
      validator: (value) => value!.isEmpty ? "Please enter mobile number" : null,
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      controller: password,
      keyboardType: TextInputType.text,
      autofocus: false,
      obscureText: true,
      //decoration: buildInputDecoration('Password', Icons.lock),
      validator: (value) => value!.isEmpty ? "Please enter password" : null,
    );
  }

  Widget confirmPasswordTextFormField() {
    return TextFormField(
      controller: confirmPassword,
      keyboardType: TextInputType.text,
      autofocus: false,
      obscureText: true,
      //decoration: buildInputDecoration('Confirm Password', Icons.lock),
      validator: (value) => value!.isEmpty ? "Please enter confirm password" : null,
    );
  }

  Widget payPalTextFormField() {
    return TextFormField(
      controller: paypalid,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //decoration: buildInputDecoration('Paypal Id', Icons.payments_outlined),
      validator: (value) => value!.isEmpty ? "Please enter paypal Id" : null,
    );
  }

  Widget button(String title, Function fun) {
    return MaterialButton(
      onPressed: null,
      height: 50.0,
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.only(
            topRight: const Radius.circular(600.0),
            bottomLeft: const Radius.circular(600.0),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.green.shade600,
              Colors.indigo.shade900,
              Colors.indigo.shade900
            ],
          ),
        ),
        child: GestureDetector(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inder(
                height: 2,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        width: 250,
        height: 50.0,
      ),
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Or create using social media",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/googlelogo.png"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/fblogo.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
            //  Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Pay now",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
