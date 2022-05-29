// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Favorite(),
    );
  }
}

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  // Future<List<Album>> getData() async {
  //   String url = 'https://jsonplaceholder.typicode.com/albums';
  //   var jsonData = await http.get(Uri.parse(url));
  //   if (jsonData.statusCode == 200) {
  //     List data = jsonDecode(jsonData.body);
  //     List<Album> allusers = [];
  //     for (var u in data) {
  //       Album album = Album.fromjson(u);
  //       allusers.add(album);
  //     }
  //     return allusers;
  //   } else {
  //     throw Exception('error');
  //   }
  // }
  //
  // Future<List<Album>>? users;

  @override
  void initState() {
    // users = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Favorite',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ),
        // body: FutureBuilder(
        //   future: users,
        //   builder: (context, snapshout) {
        //     var myList = snapshout.data as List<Album>;
        //     return GridView.builder(
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         childAspectRatio: 0.85,
        //       ),
        //       itemBuilder: (context, index) {
        //         return Container(
        //           width: double.infinity,
        //           child: const Card(
        //             elevation: 5,
        //             // child: Text(
        //             //     "ID: ${snapshout.data[index].id} \n title : ${snapshout.data[index].title}"),
        //           ),
        //         );
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
//
// class CustomSearchBar extends SearchDelegate {
//   List<String> search = ['Jeans', 'Tops', 'hoodies'];
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     List<String> matchQuery = [];
//     for (var item in search) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     List<String> matchQuery = [];
//     for (var item in search) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }
