import 'dart:ui';
import 'package:drb/products_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'cart_page.dart';
import 'productDetails_page.dart';

// Custom class to show the data.
class Category {
  String name, image;
  Category({required this.name, required this.image});
}

// Custom list to show the data.
class itemsData {
  final List<Category> _items = <Category>[
    Category(name: 'item1', image: ''),
    Category(name: 'item2', image: ''),
    Category(name: 'item3', image: ''),
    Category(name: 'item2', image: ''),
    Category(name: 'item3', image: ''),
  ];
// List <Category> get items => _items;
}

class store_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: store(),
    );
  }
}

class store extends StatefulWidget {
  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> _itemsData = itemsData()._items;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                Get.to(cart());
              },
              color: Colors.white,
              icon: const Icon(Icons.shopping_bag),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.all(10),
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
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 110,
                left: 8,
                right: 8,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  delay: const Duration(milliseconds: 100),
                                  child: AdSpace(_itemsData[index]),
                                ),
                              ),
                            );
                          },
                          itemCount: _itemsData.length,
                        ),
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
                            Get.to(products());
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
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    columnCount: 2,
                                    child: ScaleAnimation(
                                      child: FadeInAnimation(
                                        delay: Duration(milliseconds: 100),
                                        child: Categories(_itemsData[index]),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: _itemsData.length,
                              ),
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
                            Get.to(products());
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
                    Container(
                      height: 200.0,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  delay: const Duration(milliseconds: 100),
                                  child: card2(_itemsData[index]),
                                ),
                              ),
                            );
                          },
                          itemCount: _itemsData.length,
                        ),
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
                            Get.to(products());
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
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: _itemsData.length,
                        itemBuilder: (BuildContext context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                delay: const Duration(milliseconds: 100),
                                child: ProductImages(_itemsData[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
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
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
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
Widget AdSpace(Category category) => Card(
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
                  image: AssetImage(category.image),
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
Widget card2(Category category) => Card(
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
                  image: AssetImage(category.image),
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
Widget ProductImages(Category category) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 183,
            height: 156,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.fill,
              ),
            ),
            child: InkWell(
              onTap: () {
                Get.to(productDetails_page());
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: GestureDetector(
                  child: Text(
                    category.name,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

//this is the design created to show a list of data.
Widget Categories(Category category) => ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlineButton(
            child: Text(
              category.name,
              style: const TextStyle(color: Colors.white),
            ),
            highlightedBorderColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {}),
      ],
    );
