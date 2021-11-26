
import 'package:dean_institute_mobile_app/pages/home_items/appall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
////import 'package:dean_institute_mobile_app/pages/home_items/All.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/subthree.dart';
import 'package:dean_institute_mobile_app/pages/home_items/subone.dart';
import 'package:dean_institute_mobile_app/pages/home_items/all.dart';
import 'package:dean_institute_mobile_app/pages/home_items/subtwo.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 6,
        child: new Scaffold(
          body: new NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    title: const Text("Courses"),
                    actions: <Widget>[
                      new IconButton(
                          icon: new Icon(Icons.search), onPressed: () {}),
                      new IconButton(
                          icon: new Icon(Icons.more_vert), onPressed: () {})
                    ],
                    forceElevated: innerBoxIsScrolled,
                    snap: false,
                    pinned: false,
                    floating: false,
                    bottom: new TabBar(
                        indicatorColor: Colors.red,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 8,
                        tabs: <Tab>[
                          new Tab(text: "all"),
                          new Tab(text: "one"),
                          new Tab(text: "highschooln"),
                           new Tab(text: ""),
                            new Tab(text: ""),
                             new Tab(text: ""), 
                        ]),
                  )
                ];
              },
              body: new TabBarView(
                children: <Widget>[
                 // new MyAppall(),
                 new MyAlll(),
                   // new MyAll(),
                      //new MyAlltwo(),
                        //new MyAll(),
                 
                 // new MyAll(),
                 // new MyAll(),
                ],
              )),
        ));
    // TODO: implement build
  }
}