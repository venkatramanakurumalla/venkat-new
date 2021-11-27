import 'package:flutter/material.dart';
//import 'package:flui/payment.dart';
import 'package:dean_institute_mobile_app/pages/home_items/payment.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';
import '../thanku_page.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeServices.init();
  }

  void payNow() async {
    //the amount must be transformed to cents
    var response =
    await StripeServices.payNowHandler(amount: '111', currency: 'USD');
      Get.snackbar(
              response.message,
               "Hello",
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
     content: Text(response.message);
     
        duration: new Duration(milliseconds: response.success == true ? 1200 : 3000);
   // print('response message ${response.message}');
  }
  void payNow1() async {
    //the amount must be transformed to cents
    var response =
    await StripeServices.payNowHandler(amount: Get.arguments[1], currency: 'USD');
      Get.snackbar(
              response.message,
               "Hello",
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
     content: Text(response.message);
        duration: new Duration(milliseconds: response.success == true ? 1200 : 3000);
    // Get.to(ThankYouPage());
   // print('response message ${response.message}');
   // print('response message ${response.m}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //Center(
        Column(  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children:<Widget>[  
            Container(  
              margin: EdgeInsets.all(20.0),  
              padding: EdgeInsets.all(12.0),  
              decoration:BoxDecoration(  
                  //borderRadius:BorderRadius.circular(1),  
                //  color:Colors.blue
              ),  


               child:TextButton(
          onPressed: () {
           payNow1();
          },
          child:Image.network('https://deaninstitute.fastrider.co//'+Get.arguments[0]),

          ),
              
             // child: Text("React.js",style: TextStyle(color:Colors.yellowAccent,fontSize:20),),  
            ),  
            Container(  
              margin: EdgeInsets.all(20.0),  
             // padding: EdgeInsets.all(12.0),  
              decoration:BoxDecoration(  
                //  borderRadius:BorderRadius.circular(1),  
                //  color:Colors.blue  
              ),  
         child:     PushableButton(
  child: Text('PAY NOW 😎'+Get.arguments[1]),
  height: 60,
  elevation: 8,
  hslColor: HSLColor.fromAHSL(1.0, 195, 1.0, 0.43),//(1.0, 120, 1.0, 0.37),
  shadow: BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 2),
  ),
  onPressed: () => payNow()),
)

        
           ] ));
 }
}