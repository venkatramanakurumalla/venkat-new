import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreenn extends StatefulWidget {
  @override
  _HomeScreennState createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
//Step 3
  _HomeScreennState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

//Step 1
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio(); // for http requests
  String _searchText = "";
  //List names = new List();
  var names = [];
   // names we get from API
  //List filteredNames = new List(); // names filtered by search text
  var  filteredNames = [];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');

  //step 2.1
  void _getNames() async {
    final response =
        await dio.get('https://www.deaninstitute.fastrider.co/api/search-course?');
      //  https://www.deaninstitute.fastrider.co/api/search-course?Qa
    //  https://www.deaninstitute.fastrider.co/api/search-course?softwere

   // print(response.data);
   // List tempList = new List();
    var tempList = [];
    for (int i = 0; i < response.data.length; i++) {
      tempList.add(response.data[i]);
    }
    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }

//Step 2.2
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  //Step 4
  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
    //  List tempList = new List();
      var tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['slug']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['slug']),
          onTap: () => print(filteredNames[index]['slug']),
        );
      },
    );
  }

  //STep6
  Widget buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _getNames,
      ),
    );
  }

  @override
  void initState() {
    _getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: 
                _searchPressed,
              
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
     //  AppBar(
       // centerTitle: true,
       // title: _appBarTitle,
    //    leading: new IconButton(
     //   icon: _searchIcon,
        //  onPressed: _searchPressed,
     //   ),
    // ),
   //  appBar:buildBar(context ),// buildBar(context),
     body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
//     floatingActionButton: FloatingActionButton(
//        onPressed: _postName,
     // child: Icon(Icons.add),
  //  ),
    );
  }
}






