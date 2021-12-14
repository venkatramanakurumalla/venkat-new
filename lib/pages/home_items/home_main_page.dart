
import 'package:dean_institute_mobile_app/pages/home_items/courses_page.dart';
import 'package:dean_institute_mobile_app/pages/home_items/course_pageone.dart';
import 'package:dean_institute_mobile_app/pages/home_items/sample_data.dart';
import 'package:dean_institute_mobile_app/pages/home_items/subone.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page1.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page2.dart';
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:dean_institute_mobile_app/widgets/course_list_item.dart';
import 'package:dean_institute_mobile_app/widgets/dynamic_tabs.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import 'package:dean_institute_mobile_app/data/character_api.dart';
import 'package:dean_institute_mobile_app/model/character.dart';
import 'dart:convert';
import 'package:dean_institute_mobile_app/pages/home_items/dp.dart';
import 'package:dean_institute_mobile_app/pages/home_items/subtwo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
   @override
  _HomeState createState() => _HomeState();
}
var van= Get.put(LoginPage); 


class _HomeState extends State<Home> {
  var characterList= <Character>[]; 
var characterList1= <Character>[]; 
var characterList2= <Character>[]; 
var characterList3= <Character>[]; 
  void getCharactersfromApi() async {
    CharacterApi.getCharacters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => Character.fromJson(model)).toList();
      });
    });
     void getCharactersfromApi1() async {
    CharacterApi1.getCharacters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
       characterList1 = list.map((model) => Character.fromJson(model)).toList();
      });
    });
     void getCharactersfromApi2() async {
    CharacterApi2.getCharacters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList2 = list.map((model) => Character.fromJson(model)).toList();
      });
    });
     void getCharactersfromApi3() async {
    CharacterApi3.getCharacters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList3 = list.map((model) => Character.fromJson(model)).toList();
      });
    });
  }
  }
  }
  }

  @override
  void initState() {
    super.initState();
    getCharactersfromApi();
  }
//var one = Get.arguments;
dynamic email = Get.arguments;

  @override
  
 //dynamic email = Get.arguments;
 //  dynamic argumentData = Get.arguments;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      appBar: AppBar(
        
      //  title: Text(email),
      //  var one = Get.arguments;
        leading: Container(),
        toolbarHeight: 163.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        )),
        flexibleSpace: HomePageAppBar(),),
      
       body: Container(
       child: ListView.builder(
           // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
               
               /// maxCrossAxisExtent: 300,
               // childAspectRatio: 3 / 2,
               // crossAxisSpacing:5,
               // mainAxisSpacing: 5),
           itemCount:  characterList.length,
            itemBuilder: (BuildContext ctx, index) {
                return 
               ListTile(
                  title: Text(characterList[index].category_name),
                 subtitle: Text("Enroll Now"),
                 // leading: CircleAvatar(
                  //  background 
                   leading: Image.network("https://deaninstitute.fastrider.co//"+characterList[index].category_logo),
                   // title: Text(characterList[index].category_name),
                 onTap: () {
                      if(index==0){
                        Get.to(MyAllit(),arguments:characterList[index].category_name);
                       // MyAllitsc1
                      }
                      else if(index==1){
                        Get.to(MyAppcc(),arguments:characterList[index].category_name);
                      }
                      else if(index==2){
                      //
                      
                      }
                       else if(index==3){
                     //  Get.to(MyAppcc (),arguments:characterList[index].category_name);
                      }
                       else if(index==4){
                      // Get.to(Home(),arguments:characterList[index].category_name);
                      }
                       
                       else if(index==5){
                     //  Get.to(Home());
                      }
                 // ),
                       }  );

                 // ),
             //   );
              
            })));
      
    
  }
}