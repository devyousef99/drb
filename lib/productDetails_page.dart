import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:group_button/group_button.dart';

class Category {
  String name, image;
  Category({ required this.name,  required this.image});
}

// Custom list to show the data.
class itemsData {
  final List<Category> _items = <Category>[
    Category(name: 'item1', image: 'assets/signin.jpeg'),
    Category(name: 'item2', image: 'assets/signin.jpeg'),
    Category(name: 'item3', image: 'assets/signin.jpeg'),
    Category(name: 'item4', image: 'assets/signin.jpeg'),
    Category(name: 'item5', image: 'assets/signin.jpeg'),
  ];
// List <Category> get items => _items;
}

class productDetails_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: productDetails(),
    );
  }
}

class productDetails extends StatefulWidget {
  @override
  _productDetailsState createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
   String? ValueChoose;
  int _counter = 1;
  List listItem = ['XS', 'S', 'M', 'L', 'XL'];
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
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 840,
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  height: 300.0,
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
                            child: productImages(_itemsData[index]),
                          ),
                        ),
                      );
                    },
                    itemCount: _itemsData.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, bottom: 5.0, right: 5.0, top: 5.0),
                      child: Text(
                        'info..',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 185.0, bottom: 5.0, right: 5.0, top: 5.0),
                      child: Text(
                        'Qty',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: DropdownButton(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20.0),
                        value: ValueChoose,
                        icon: Icon(Icons.keyboard_arrow_down),
                        hint: Text(
                          'XS',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            // ValueChoose = newValue;
                          });
                          switch (newValue) {
                            case "XS":
                              break;
                            case "S":
                              break;
                            case "M":
                              break;
                            case "L":
                              break;
                            case "XL":
                              break;
                          }
                        },
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(
                              valueItem,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 220.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black54),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_counter >= 2) {
                                      _counter--;
                                    } else {
                                      return null;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 16,
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white),
                              child: Text(
                                '$_counter',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _counter++;
                                  });
                                  },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        right: 5.0,
                        top: 10.0,
                      ),
                      child: Text(
                        'Color',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, bottom: 5.0, right: 20.0, top: 0.0),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 100.0,
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
                                    child: productColors(_itemsData[index]),
                                  ),
                                ),
                              );
                            },
                            itemCount: _itemsData.length,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, bottom: 5.0, right: 20.0, top: 5.0),
                      child: Text(
                        'Products related to this item',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, bottom: 10.0, right: 10.0, top: 0.0),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 100.0,
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
                                    child: productColors(_itemsData[index]),
                                  ),
                                ),
                              );
                            },
                            itemCount: _itemsData.length,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 5.0, top: 5.0, bottom: 0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black),
                        child: MaterialButton(
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 50.0),
                            child: Text(
                              'ADD TO CART',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget productImages(Category category) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 280,
            height: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );

Widget productColors(Category category) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
