
import 'dart:async';
import 'dart:convert';

import 'package:dean_institute_mobile_app/data/character_api.dart';
import 'package:dean_institute_mobile_app/model/Courses.dart';
import 'package:dean_institute_mobile_app/model/character.dart';
import 'package:dean_institute_mobile_app/pages/home_items/course_pageone.dart';
import 'package:dean_institute_mobile_app/pages/home_items/courses_page.dart';
import 'package:dean_institute_mobile_app/pages/home_items/dp.dart';
import 'package:dean_institute_mobile_app/pages/home_items/sample_data.dart';
import 'package:dean_institute_mobile_app/pages/home_items/subone.dart';
import 'package:dean_institute_mobile_app/pages/home_items/subtwo.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page1.dart';
import 'package:dean_institute_mobile_app/pages/it%20pages/page2.dart';
import 'package:dean_institute_mobile_app/services/BooksApi.dart';
import 'package:dean_institute_mobile_app/widgets/SearchWidget.dart';
import 'package:dean_institute_mobile_app/widgets/course_list_item.dart';
import 'package:dean_institute_mobile_app/widgets/dynamic_tabs.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}
 
class _SearchState extends State<Search> {
  List<Courses> books = [];
  String query = '';
  Timer? debouncer;

  var characterList = <Character>[];
  var characterList1 = <Character>[];
  var characterList2 = <Character>[];
  var characterList3 = <Character>[];
  late List<Character> couses;

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
          characterList1 =
              list.map((model) => Character.fromJson(model)).toList();
        });
      });
      void getCharactersfromApi2() async {
        CharacterApi2.getCharacters().then((response) {
          setState(() {
            Iterable list = json.decode(response.body);
            characterList2 =
                list.map((model) => Character.fromJson(model)).toList();
          });
        });
        void getCharactersfromApi3() async {
          CharacterApi3.getCharacters().then((response) {
            setState(() {
              Iterable list = json.decode(response.body);
              characterList3 =
                  list.map((model) => Character.fromJson(model)).toList();
            });
          });
        }
      }
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getCharactersfromApi();
  // }

  @override
  void initState() {
    super.initState();
    getCharactersfromApi();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await BooksApi.getBooks(query);

    setState(() => this.books = books);
  }

//var one = Get.arguments;
  dynamic email = Get.arguments;

  @override
  //dynamic email = Get.arguments;
  //  dynamic argumentData = Get.arguments;
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Color(0xFFE9E9E9),
       // appBar: AppBar(
          //  title: Text("${email}"),
          //  var one = Get.arguments;
         // leading: Container(),
         // toolbarHeight: 163.h,
         // shape: RoundedRectangleBorder(
             // borderRadius: BorderRadius.only(
               // bottomLeft: Radius.circular(30.r),
              //  bottomRight: Radius.circular(30.r),
             // )),
        //  flexibleSpace: HomePageAppBar(),
      //  ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        )
    );
  }

  Widget buildSearch() =>
      SearchWidget(
        text: query,
        hintText: 'Search courses',
        onChanged: searchCourses,
      );

  Future searchCourses(String query) async => debounce(() async {
    final books = await BooksApi.getBooks(query);
    if (!mounted) return;
    setState(() {
      this.query = query;
      this.books = books;
    });
  });

  Widget buildBook(Courses book) => ListTile(
  //  leading: Image.network(
    leading:Text(
      book.slug,
     // fit: BoxFit.cover,
      //width: 50,
     // height: 50,
    ),
    
   // title: Text(book.slug),
   // subtitle: Text(book.slug),
  );
}






