import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:favorite_button/favorite_button.dart';

// Custom class to show the data.
class Category {
  String name, image;
  Category({ this.name,  this.image});
}

// Custom list to show the data.
class itemsData {
  final List<Category> _items = <Category>[
    Category(name: 'item1', image: ''),
    Category(name: 'item2', image: ''),
    Category(name: 'item3', image: ''),
    Category(name: 'item4', image: ''),
    Category(name: 'item5', image: ''),
    Category(name: 'item6', image: ''),
    Category(name: 'item7', image: ''),
  ];
// List <Category> get items => _items;
}

class categories1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: categories(),
    );
  }
}

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  var _selectedIndex;
  void initState() {
    super.initState();
    _selectedIndex = 0;
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
          // title: Padding(
          //   padding: EdgeInsets.only(right: 200.0),
          //   child: Text(
          //     'Items',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          backgroundColor: Colors.transparent,
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
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.0, right: 5.0, top: 70.0, bottom: 0.0),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 175.0, right: 0.0, top: 70.0, bottom: 0.0),
                      child:
                          FlatButton(child: Text('View All'), onPressed: () {}),
                    ),
                  ],
                ),
                Container(
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
                            child: mylistItem_categories(_itemsData[index]),
                          ),
                        ),
                      );
                    },
                    itemCount: _itemsData.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 15.0, bottom: 0.0),
                  child: Text(
                    'Featued',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 0.0, bottom: 0.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                            delay: Duration(milliseconds: 100),
                            child: mylistItem_featued(_itemsData[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget mylistItem_categories(Category category) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 50,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
              image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.fill,
              ),
            ),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                category.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );

//this is the design created to show a list of data.!
Widget mylistItem_featued(Category category) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 183,
            height: 169,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
              image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  child: StarButton(
                    iconSize: 10.0,
                    valueChanged: (_) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: GestureDetector(
                  child: StarButton(
                    iconSize: 10.0,
                    valueChanged: (_) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: GestureDetector(
                  child: StarButton(
                    iconSize: 10.0,
                    valueChanged: (_) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: GestureDetector(
                  child: FavoriteButton(
                    iconSize: 10.0,
                    valueChanged: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            // padding: EdgeInsets.only(left: 10.0),
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              category.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
