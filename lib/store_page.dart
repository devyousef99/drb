// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:drb/Modules/category.dart';
import 'package:drb/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'Modules/products.dart';
import 'cart_page.dart';
import 'productDetails_page.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Store(),
    );
  }
}

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  StoreState createState() => StoreState();
}

class StoreState extends State<Store> {
  Future<List<Products>> _products() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:8000/product/get"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Category>> _category() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:8000/product/get_cat"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Category.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    _products();
    _category();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Community Of Creators',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const Cart());
            },
            color: Colors.white,
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: FutureBuilder(
                      future: _products(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              List<Products> item = snapshot.data;
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    delay: const Duration(milliseconds: 100),
                                    child:
                                        adSpace(item[index].detail![0].prImg),
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data.length,
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
// By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(Product());
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: FutureBuilder(
                            future: _category(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    List<Category> item = snapshot.data;
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: FadeInAnimation(
                                          delay:
                                              const Duration(milliseconds: 100),
                                          child: InkWell(
                                              onTap: () {
// Navigator.push(context,
//     MaterialPageRoute(
//         builder: (context) => products_page(),
//     settings: RouteSettings(
//       arguments: item[index]
//     )));
                                                print('object');
                                              },
                                              child: categories(
                                                  item[index].catName)),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data.length,
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
// By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Newest',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(Product());
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200.0,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: FutureBuilder(
                      future: _products(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              List<Products> item = snapshot.data;
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    delay: const Duration(milliseconds: 100),
                                    child: card2(item[index].detail![0].prImg),
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data.length,
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
// By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(Product());
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: FutureBuilder(
                    future: _products(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, index) {
                            List<Products> item = snapshot.data;
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  delay: const Duration(milliseconds: 100),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetail(),
                                              settings: RouteSettings(
                                                  arguments: item[index])));
                                    },
                                    child: productImages(
                                        item[index].detail![0].prImg,
                                        item[index].prName,
                                        item[index].detail![0].prPrice),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
// By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ['A', 'd', 'd'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var x in searchTerms) {
      if (x.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(x);
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
    List<String> matchQuery = [];
    for (var x in searchTerms) {
      if (x.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(x);
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

//this is the design created to show a list of data.
Widget adSpace(String? image) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 300,
              height: 200,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage('http://10.0.2.2:8000' + image!),
                  fit: BoxFit.fill,
                ),
              ),
              child: MaterialButton(
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );

//this is the design created to show a list of data.
Widget card2(String? img) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage('http://10.0.2.2:8000' + img!),
                  fit: BoxFit.fill,
                ),
              ),
              child: MaterialButton(
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );

//this is the design created to show a list of data.
Widget productImages(String? image, String? name, String? price) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 183,
            height: 169,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage('http://10.0.2.2:8000' + image!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  name!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Text(
                  price!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );

//this is the design created to show a list of data.
Widget categories(String? name) => ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ignore: deprecated_member_use
        OutlineButton(
            child: Text(
              name!,
              style: const TextStyle(color: Colors.white),
            ),
            highlightedBorderColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {}),
      ],
    );
