import 'dart:convert';
import 'package:dean_institute_mobile_app/pages/home_items/home_main_page.dart';
import 'package:dean_institute_mobile_app/pages/home_items/subc.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page1.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page10.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page11.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page12.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page13.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page14.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page15.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page16.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page17.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page18.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page2.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page3.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page4.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page5.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page6.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page7.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page8.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page9.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:get/get.dart";
import 'package:dean_institute_mobile_app/pages/course_details_page.dart';
import 'package:dean_institute_mobile_app/pages/home_items/dp.dart';


  
void main() => runApp(MyAllit());
  
class MyAllit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class User {
  late int id;
  late int categoryId;
  late int subcategoryId;
  late int childcategoryId;
 late String title;
  late String slug;
  late String description;
  late String image;
  late String classType;
  late Null video;
 late String enroll;
  late String hours;
  late Null meetingLink;
  late Null classStartTime;
  late Null referenceLink;
  late Null materialLink;
  late String regularClass;
  late String reviewClass;
  late String sellingPrice;
  late String discountType;
  late String discount;
 late String discountPrice;
 late String priceActive;
  late Null seoKeyword;
 late  Null seoDescription;
  late Null order;
  late String status;
 late  String createdBy;
  late String updatedBy;
   late Null deletedBy;
   late String createdAt;
  late String updatedAt;

  User(
      { //required this.image,
         required this.id,
          required this.slug,
       //   required this.description,
          // required this.title,
            
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    childcategoryId = json['childcategory_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    classType = json['class_type'];
    video = json['video'];
    enroll = json['enroll'];
    hours = json['hours'];
    meetingLink = json['meeting_link'];
    classStartTime = json['class_start_time'];
    referenceLink = json['reference_link'];
    materialLink = json['material_link'];
    regularClass = json['regular_class'];
    reviewClass = json['review_class'];
    sellingPrice = json['selling_price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    priceActive = json['price_active'];
    seoKeyword = json['seo_keyword'];
    seoDescription = json['seo_description'];
    order = json['order'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] =this.categoryId;
    data['subcategory_id'] =this.subcategoryId;
    data['childcategory_id'] = this.childcategoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['class_type'] = this.classType;
    data['video'] = this.video;
    data['enroll'] = this.enroll;
    data['hours'] = this.hours;
    data['meeting_link'] = this.meetingLink;
    data['class_start_time'] =this.classStartTime;
    data['reference_link'] =this.referenceLink;
    data['material_link'] = this.materialLink;
    data['regular_class'] = this.regularClass;
    data['review_class'] = this.reviewClass;
    data['selling_price'] =this.sellingPrice;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['discount_price'] =this.discountPrice;
    data['price_active'] = this.priceActive;
    data['seo_keyword'] =this.seoKeyword;
    data['seo_description'] = this.seoDescription;
    data['order'] =this.order;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] =this.updatedBy;
    data['deleted_by'] = this.deletedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
  
//Creating a class user to store the data;
class User1 {
   var id;
  var category_id;
 // var subcategory_name;
  // final String subcategory_logo ;
  var slug;
  var order;
  var created_at;
  var updated_at;
  //final int id;
  
  
  User1({
    required this.id,
    //required this.subcategory_name,
    required this.slug,
   // requiredrequired this.subcategory_logo,
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
    String url = "https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1";
   // String url ="https://deaninstitute.fastrider.co/api/all-sub-category";
    // String url="https://www.deaninstitute.fastrider.co/api/course-by-subcategory/1";

    //https://https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1
    final response = await http.get(Uri.parse(url));
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
    List<User> users = [];
   for (var singleUser in responseData) {
      User user = User(
         id: singleUser["id"],
     // description:singleUser["description"], 
       //  title:singleUser["title"], 
        // image: singleUser["image"],
         // subcategory_logo: singleUser["subcategory_logo"],
       // subcategory_name: singleUser["subcategory_name"],
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
                 color: (index % 3 == 0) ? Colors.orange[200] : Colors.green[200] ,
               // color:Colors.orange[200],
        elevation: 1.0,
        child: Column(
          children: [
            ListTile(
             title: Text(snapshot.data[index].slug,textAlign: TextAlign.center,),
              subtitle: Text("Enroll now"),
          
           //  trailing: Image.network('https://deaninstitute.fastrider.co//'+snapshot.data[index].image),
            // trailing: Icon(Icons.book_online),
              onTap: () {
                      if(index==0){
                       //  Get.to(MyAllitsc1(),arguments:[snapshot.data[index].slug,snapshot.data[index].description,]);
                        // Get.to(CourseDetails(  courseModel: s, ));
                     Get.to(MyAllitsc1());
                      }
                      else if(index==1){
                        //  Get.to(MyAllitsc2(),arguments:[snapshot.data[index].slug,snapshot.data[index].description,]);
                         // Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                          //Get.to(CourseDetails);
                          Get.to(MyAllitsc2());
                       // Get.to(MyAll());
                      }
                      else if(index==2){
                        //  Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                       //Get.to(MyAll());
                        Get.to(MyAllitsc3());
                       //  Get.to(CourseDetails);
                      }
                       else if(index==3){
                          Get.to(MyAllitsc4());
                         //  Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                      // Get.to(MyAll());
                      }
                       else if(index==4){
                          Get.to(MyAllitsc5());
                         //  Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      }
                       else if(index==5){
                          Get.to(MyAllitsc6());
                         //  Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      }
                       else if(index==6){
                          Get.to(MyAllitsc7());
                          // Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      } else if(index==7){
                         Get.to(MyAllitsc8());
                           //Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      } else if(index==8){
                         Get.to(MyAllitsc9());
                          // Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      } else if(index==9){
                         Get.to(MyAllitsc10());
                           //Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      } else if(index==10){
                         Get.to(MyAllitsc11());
                         //  Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      }
                       else if(index==11){
                          Get.to(MyAllitsc12());
                          // Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      } else if(index==12){
                         Get.to(MyAllitsc13());
                         //  Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      } else if(index==13){
                         Get.to(MyAllitsc14());
                          // Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      } else if(index==14){
                         Get.to(MyAllitsc15());
                         //  Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      } else if(index==15){
                         Get.to(MyAllitsc16());
                         //  Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      }
                       else if(index==16){
                          Get.to(MyAllitsc17());
                          // Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
                      }
                       else if(index==17){
                          Get.to(MyAllitsc18());
                           Get.to(CourseDetailss(),arguments:snapshot.data[index].slug,);
                     //  Get.to(MyAll());
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