import 'dart:convert';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:drb/HTTP/album.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:http/http.dart' as http;

class categories_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: categories(),
    );
  }
}

// class Category {
//   String name, image;
//   Category({this.name, this.image});
// }

// class itemsData {
//   final List<Category> _items = <Category>[
//     Category(name: 'item1', image: ''),
//     Category(name: 'item2', image: ''),
//     Category(name: 'item3', image: ''),
//     Category(name: 'item4', image: ''),
//     Category(name: 'item5', image: ''),
//     Category(name: 'item6', image: ''),
//     Category(name: 'item7', image: ''),
//   ];
// }

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  Future<List<Album>> getData() async {
    String url = 'https://jsonplaceholder.typicode.com/albums';
    var jsonData = await http.get(Uri.parse(url));
    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<Album> allusers = [];
      for (var u in data) {
        Album album = Album.fromjson(u);
        allusers.add(album);
      }
      return allusers;
    } else {
      throw Exception('error');
    }
  }

  Future<List<Album>> users;
  var _selectedIndex;

  @override
  void initState() {
    users = getData();
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    // List<Category> _itemsData = itemsData()._items;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // elevation: 0.0,
          leading: GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchBar(),
                );
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          backgroundColor: Colors.white,
          curve: Curves.bounceOut,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Color.fromRGBO(224, 177, 74, 10),
                inactiveColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(Icons.login),
                title: Text('Cart'),
                activeColor: Color.fromRGBO(224, 177, 74, 10),
                inactiveColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(Icons.map),
                title: Text('Magazine'),
                activeColor: Color.fromRGBO(224, 177, 74, 10),
                inactiveColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Profile'),
                activeColor: Color.fromRGBO(224, 177, 74, 10),
                inactiveColor: Colors.grey),
          ],
        ),
        body:
            // SingleChildScrollView(
            // child: Container(
            //   color: Colors.grey.shade100,
            // child: Column(
            //   children: [
            //  Padding(
            //   padding: EdgeInsets.only(
            //       left: 5.0, right: 5.0, top: 0.0, bottom: 0.0),
            //   child:
            FutureBuilder(
          future: users,
          builder: (context, snapshout) {
            var myList = snapshout.data as List<Album>;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    child: Text(
                        "ID: ${snapshout.data[index].id} \n title : ${snapshout.data[index].title}"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CustomSearchBar extends SearchDelegate {
  List<String> search = ['Jeans', 'Tops', 'hoodies'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery = [];
    for (var item in search) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for (var item in search) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
