import 'dart:convert';
import 'package:dean_institute_mobile_app/pages/home_items/all.dart';
import 'package:dean_institute_mobile_app/pages/home_items/home_main_page.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:get/get.dart";
import 'package:dean_institute_mobile_app/pages/course_details_page.dart';
import 'package:dean_institute_mobile_app/pages/home_items/tabtwo.dart';
import 'package:dean_institute_mobile_app/pages/home_items/all.dart';


  
void main() => runApp(MyApp());
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

  
//Creating a class user to store the data;
class User {
   var id;
  var category_id;
  var subcategory_name;
  // final String subcategory_logo ;
  var slug;
  var order;
  var created_at;
  var updated_at;
  //final int id;
  
  
  User({
    required this.id,
    required this.subcategory_name,
    required this.slug,
   // required this.subcategory_logo,
  });
}
  
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
//Applying get request.
  
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "https://deaninstitute.fastrider.co/api/all-sub-category";
    final response = await http.get(Uri.parse(url));
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id: singleUser["id"],
         // subcategory_logo: singleUser["subcategory_logo"],
        subcategory_name: singleUser["subcategory_name"],
          slug: singleUser["slug"]);
  
      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
  
  @override
  Widget build(BuildContext context) {
   // return SafeArea(
     // child: Scaffold(
     //   backgroundColor: Color(0xFFE9E9E9),
     //   appBar: AppBar(backgroundColor:Colors.red,
       //   title: Text("IT courses"),
          //leading: Icon(
           // Icons.get_app,
         // ),
      //  ),

 return Scaffold(
     // backgroundColor: Color(0xFF932020);
      appBar: AppBar(
 backgroundColor: Color(0xFF932020),
       // backgroundColor:Colors.red,
       // leading: Contain
       // er(),
       title:Text("IT Courses",textAlign: TextAlign.center),
      //  toolbarHeight: 163.h,
       // shape: RoundedRectangleBorder(
         //   borderRadius: BorderRadius.only(
         // bottomLeft: Radius.circular(30.r),
         // bottomRight: Radius.circular(30.r),
       // )),
        //flexibleSpace: HomePageAppBar(),),

      ),
        body: // Flexible(
        
        Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return //ListView.builder(
                   GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing:5,
                mainAxisSpacing: 5),
                  itemCount: snapshot.data.length,
                 itemBuilder: (ctx, index){return Container(
            child:      SizedBox(
 // height: double.infinity, 
 height: 1000,
    
              child:     Card(
        elevation: 1.0,
        child: Column(
          children: [
            ListTile(
              title: Text(snapshot.data[index].subcategory_name,textAlign: TextAlign.center,),
              subtitle: Text("Enroll now"),
            // trailing: Icon(Icons.favorite_outline),
             trailing: Icon(Icons.book_online),
              onTap: () {
                      if(index==0){
                         Get.to(  HomeScreen(), );
                      }
                      else if(index==1){
                      //  Get.to(MyAll());
                      }
                      else if(index==2){
                       Get.to( HomeScreen(),);
                      }
                       else if(index==3){
                       Get.to(HomeScreen());
                      }
                       else if(index==4){
                       Get.to( HomeScreen(),);
                      }
                       else if(index==5){
                      // Get.to(MyAll());
                      }
                 // ),
                       }  ),

           // ),
               // shape: RoundedRectangleBorder(
     // borderRadius: BorderRadius.circular(10.0),
    //),
    //elevation: 5,
   // margin: EdgeInsets.all(10),
          ]),
),   
                 // child:
              // child:   buildCard(),
              //  alignment: Alignment.center,
                 // child:   Text(snapshot.data[index].slug),
               // child: Text(myProducts[index]["name"]),
               // decoration: BoxDecoration(
                  ////  color: Colors.green,
                  //  borderRadius: BorderRadius.circular(20)),
           //   );
                  
                   
                   
                    
                    
                   
                  // } 
            // ]  
             ));//);
              //}
            },
         // ),
        //),
     );
  }})));}}