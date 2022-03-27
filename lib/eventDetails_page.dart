// ignore_for_file: file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_page.dart';

class eventDetails_page extends StatefulWidget {
  const eventDetails_page({Key? key}) : super(key: key);

  @override
  State<eventDetails_page> createState() => _eventDetails_pageState();
}

class _eventDetails_pageState extends State<eventDetails_page> {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
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
          actions: [
            IconButton(
              onPressed: () {
                Get.to(cart());
              },
              color: Colors.black,
              icon: const Icon(Icons.shopping_bag),
            ),
          ],
          centerTitle: true,
          title:
              // passed_data != null ?
              Text(
            'Event',
            // passed_data.itemName.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )
          // : Center(),
          ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                                right: 8, left: 8, top: 10, bottom: 8),
                            width: 300,
                            height: 180,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                // color: Color.fromRGBO(138, 71, 241, 1.0),
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromRGBO(138, 71, 241, 1.0),
                                      Color.fromRGBO(
                                          138, 71, 241, 0.8156862745098039),
                                      Colors.black87
                                    ])),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 25),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'name',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'name',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.lightBlueAccent),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'host',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'pr',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    'About this event',
                    // passed_data!.itemName.toString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0),
                  child: Text(
                    'des',
                    // passed_data.itemDesc.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    'Details',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.calendar_today_rounded,
                            color: Color.fromRGBO(88, 93, 249, 1.0),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('date'),
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.videocam_rounded,
                            color: Color.fromRGBO(88, 93, 249, 1.0),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('virtual'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.timelapse_outlined,
                            color: Color.fromRGBO(88, 93, 249, 1.0),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('time'),
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.monetization_on_outlined,
                            color: Color.fromRGBO(88, 93, 249, 1.0),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('pr'),
                        ],
                      ),
                    ),
                    // Row(
                    //   children: [
                    // TextButton.icon(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     Icons.location_on_rounded,
                    //     color: Color.fromRGBO(110, 114, 253, 0.9),                              ),
                    //   label: const Text(
                    //     'Location',
                    //     style: TextStyle(
                    //       color: Color.fromRGBO(110, 114, 253, 0.9),
                    //     ),
                    //   ),), )
                    // ],
                    // ),
                  ],
                ),
              ],
            ),
            // const SizedBox(height: 15),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.only(
            //         left: 20.0,
            //       ),
            //       child: Text(
            //         'Quantity',
            //         style:
            //             TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 100,
            //     ),
            //     DropdownButtonHideUnderline(
            //       child: DropdownButton2(
            //         selectedItemHighlightColor:
            //             const Color.fromRGBO(110, 114, 253, 0.9),
            //         // hint: const Text(
            //         //   'Select size',
            //         //   style: TextStyle(
            //         //     fontSize: 14,
            //         //     color: Color.fromRGBO(110, 114, 253, 0.9),
            //         //   ),
            //         // ),
            //         items: items
            //             .map((item) => DropdownMenuItem<String>(
            //                   value: item,
            //                   child: Text(
            //                     item,
            //                     style: const TextStyle(
            //                         fontSize: 14, color: Colors.black),
            //                   ),
            //                 ))
            //             .toList(),
            //         value: selectedValue,
            //         onChanged: (value) {
            //           setState(() {
            //             selectedValue = value as String;
            //           });
            //         },
            //         buttonHeight: 40,
            //         buttonWidth: 100,
            //         itemHeight: 40,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350.0,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(110, 114, 253, 0.9),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Join',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
