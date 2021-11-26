import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

import '../thanku_page.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  // var t= Get.to(ThankYouPage());
 //-var t= Get.to(ThankYouPage());
 // var g= Get.snackbar(
            // " Sucessful payment",
             // "thank you ",
             //  icon: Icon(Icons.person, color: Colors.white),
               //snackPosition: SnackPosition.BOTTOM,
              // backgroundColor: Colors.red,
             //  borderRadius: 20,
             //  margin: EdgeInsets.all(15),
             //  colorText: Colors.white,
             //  duration: Duration(seconds: 10),
             // isDismissible: true,
            //  dismissDirection: SnackDismissDirection.HORIZONTAL,
             // forwardAnimationCurve: Curves.easeOutBack,

             //   );
              // var h= Get.snackbar(
              //"un Sucessful payment",
             //  "thank you ",
              // icon: Icon(Icons.person, color: Colors.white),
             //  snackPosition: SnackPosition.BOTTOM,
             //  backgroundColor: Colors.red,
             //  borderRadius: 20,
              // margin: EdgeInsets.all(15),
             //  colorText: Colors.white,
              // duration: Duration(seconds: 10),
              // isDismissible: true,
              // dismissDirection: SnackDismissDirection.HORIZONTAL,
              // forwardAnimationCurve: Curves.easeOutBack,

             //  );

  StripeTransactionResponse({
    required this.message,
    required this.success,
  //  required this.h, 
     
   //  required this.g,
    // required this.t,
  });
}

class StripeServices {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeServices.apiBase}/payment_intents';
  static Uri paymentApiUri = Uri.parse(paymentApiUrl);
  static String secret =
      'sk_test_51JPqrYSBtCOIyCFtGzYgQdO7wIs9dNSS9Tgvo7jQ5phFbYAEjuwWI95vut55t3YOiSOCTwmE19SMiayFqE5Azd4g009G6xs8Dt';

  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeServices.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
        'pk_test_51JPqrYSBtCOIyCFtizgVpjDQAibCuY983h4MYUGwrWRALR9RL2j9vsuhzW279LVCjfx8Aqt5cpPuUWcGeTaBqxSH00mRBRc4ax',
        androidPayMode: 'test',
        merchantId: 'test'));
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response =
      await http.post(paymentApiUri, headers: headers, body: body);
      return jsonDecode(response.body);
    } catch (error) {
      print('error Happened');
      throw error;
    }
  }

  static Future<StripeTransactionResponse> payNowHandler(
      {required String amount, required String currency}) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      var paymentIntent =
      await StripeServices.createPaymentIntent(amount, currency);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id));
       //   var t= Get.to(ThankYouPage());

      if (response.status == 'succeeded') {
 
 // Get.to(ThankYouPage());
       //  Get.to(ThankYouPage());
                      // Get.to(MyAll());
        return 
       // Get.to(ThankYouPage());
     // Future(computation)   Get.to(ThankYouPage());
      StripeTransactionResponse(
          message:"Sucess"
        
       , success: true,);
        // Get.to(ThankYouPage());
      // );
           //  Get.to(CourseDetailss(),arguments:snapshot.data[index].childcategory_name,);
                      // Get.to(MyAll());


      } else {
          Get.snackbar(
              "un Sucessful",
               "Hello ",
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
        return StripeTransactionResponse(
            message: 'Transaction failed', success: false,);
      }
    } catch (error) {
     // return StripeTransactionResponse(
       //   message: 'Transaction in Block', success: false);
    //} on PlatformException catch (error) {
      return StripeServices.getErrorAndAnalyze(error);
    }
  }

  static getErrorAndAnalyze(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
        Get.snackbar(
              "Something went wrong",
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
      message = 'Transaction canceled';
    }
    return StripeTransactionResponse(message: message, success: false);
  }
}