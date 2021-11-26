import 'package:dean_institute_mobile_app/pages/home_items/bootcamp_page.dart';
import 'package:dean_institute_mobile_app/pages/home_items/courses_page.dart';
import 'package:dean_institute_mobile_app/pages/home_items/home_main_page.dart';
import 'package:dean_institute_mobile_app/pages/home_items/profile_page.dart';
import 'package:dean_institute_mobile_app/utility/dean_institute_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:dean_institute_mobile_app/pages/about.dart';
//import 'package:dean_institute_mobile_app/pages/search.dart';
import 'package:dean_institute_mobile_app/pages/home_items/search.dart';

import 'home_items/all.dart';
import 'home_items/self_courses_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _bottomNavigationPages = [
    Home(),
   // Courses(),
  //  CharacterList(),
  MyAlll(),
 // MyApp(),
   // Bootcamp(),
  // Myabout(),
   Profile(),
    HomeScreenn(),
  // MyCourses(),
  //  Profile(),
     Myabout()
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_stories,
            ),
            label: "AllCourses",
          ),
         // BottomNavigationBarItem(
           // icon: Icon(
            //  Icons.collections_bookmark_rounded,
           // ),
           // label: "About",
           BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
               Icons.search,
             // DeanInstituteIcons.library_icon,
            ),
           // label: "My Courses",
           label: "Serch",
          ),
         // BottomNavigationBarItem(
            //icon: Icon(
            //  Icons.person,
           // ),
          //  label: "Profile",
           BottomNavigationBarItem(
            icon: Icon(
              Icons.collections_bookmark_rounded,
            ),
            label: "About",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _getBody() {
    return _bottomNavigationPages[_selectedIndex];
  }
}
