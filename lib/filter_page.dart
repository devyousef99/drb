import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class filter_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: filter(),
    );
  }
}

class filter extends StatefulWidget {
  @override
  _filterState createState() => _filterState();
}

class _filterState extends State<filter> {
  String? ValueChoose;
  List listItem = ['Dresses', 'Tops', 'Jeans'];
  RangeValues _priceRange = const RangeValues(1, 100);

  @override
  Widget build(BuildContext context) {
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
          title: Padding(
            padding: EdgeInsets.only(left: 107.0),
            child: Text(
              'Filter',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ),
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 315.0, right: 0.0, top: 30.0, bottom: 0.0),
                child: FlatButton(child: Text('Clear'), onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 30.0, bottom: 0.0),
                child: Text(
                  'Price',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              RangeSlider(
                values: _priceRange,
                min: 1.0,
                max: 500.0,
                divisions: 100,
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                labels: RangeLabels(
                  '${_priceRange.end.round()} SR',
                  '${_priceRange.start.round()} SR',
                ),
                onChanged: (RangeValues newValues) {
                  setState(() {
                    _priceRange = newValues;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 5.0, bottom: 10.0),
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  hint: Text(
                    'Dresses',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  value: ValueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      // ValueChoose = newValue;
                    });
                    switch (newValue) {
                      case "Dresses":
                        break;
                      case "Tops":
                        break;
                      case "Jeans":
                        break;
                    }
                  },
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 5.0, bottom: 10.0),
                child: Text(
                  'Color',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 50.0, right: 5.0, top: 10.0, bottom: 5.0),
                child:
              Container(
                // width: 40,
                // height: 40,
                padding: const EdgeInsets.all(2),
                // decoration: BoxDecoration(
                  // border: Border.all(
                  //   width: 3,
                  // ),
                  // shape: BoxShape.circle,
                // ),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child:
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),),
                    ),
                Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child:
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),),
                    Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child:
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ), ),
                    Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child:
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ), ),
                    Padding(padding: EdgeInsets.only(left: 10.0, right: 2.0),
                      child:
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal,
                        ),
                      ), ),
                  ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 80.0, bottom: 5.0),
                child: Text(
                  'Size',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 5.0, bottom: 10.0),
                child: GroupButton(
                  isRadio: false,
                  spacing: 10,
                  onSelected: (index, isSelected) =>
                      print('$index button is selected'),
                  buttons: [
                    "All",
                    "XS",
                    "S",
                    "M",
                    "L",
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: 20.0, right: 5.0, top: 5.0, bottom: 5.0),
              //   child: Text(
              //     'Sort by',
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: 20.0, right: 5.0, top: 5.0, bottom: 10.0),
              //   child: DropdownButton(
              //     dropdownColor: Colors.white,
              //     hint: Text(
              //       'Trending',
              //       style: TextStyle(
              //         fontSize: 17,
              //         color: Colors.black,
              //       ),
              //     ),
              //     value: ValueChoose,
              //     onChanged: (newValue) {
              //       setState(() {
              //         ValueChoose = newValue;
              //       });
              //       switch (newValue) {
              //         case "Dresses":
              //           break;
              //         case "Tops":
              //           break;
              //         case "Jeans":
              //           break;
              //       }
              //     },
              //     items: listItem.map((valueItem) {
              //       return DropdownMenuItem(
              //         value: valueItem,
              //         child: Text(
              //           valueItem,
              //           style: const TextStyle(color: Colors.white),
              //         ),
              //       );
              //     }).toList(),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 5.0, bottom: 0.0),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.black),
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 50.0),
                      child: Text(
                        'Results',
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
        ),
      ),
    );
  }
}
