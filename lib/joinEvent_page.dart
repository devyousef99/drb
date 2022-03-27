// ignore_for_file: file_names

import 'package:drb/eventDetails_page.dart';
import 'package:drb/landing_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_page.dart';

class Category {
  String name, image;
  Category({required this.name, required this.image});
}

class artistsData {
  final List<Category> _myList = <Category>[
    Category(name: 'artist1', image: 'assets/log_in.png'),
    Category(name: 'artist2', image: 'assets/log_in.png'),
    Category(name: 'artist3', image: 'assets/log_in.png'),
  ];
  List<Category> get myList => _myList;
}

class joinEvent_page extends StatefulWidget {
  const joinEvent_page({Key? key}) : super(key: key);

  @override
  State<joinEvent_page> createState() => _joinEvent_pageState();
}

class _joinEvent_pageState extends State<joinEvent_page> {
  @override
  Widget build(BuildContext context) {
    List<Category> _artistsList = artistsData().myList;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Join Event',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: _artistsList.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: mylistItem(_artistsList[index]),
                    );
                  },
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 18, right: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Sub Total',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 60),
                              Text(':'),
                              SizedBox(width: 100),
                              Text('555'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Shipping',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 63),
                              Text(':'),
                              SizedBox(width: 100),
                              Text('555'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Estimating Tax',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(':'),
                              SizedBox(width: 100),
                              Text('555'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Discounts',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 54),
                              Text(':'),
                              SizedBox(width: 100),
                              Text('555'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 8,
                            thickness: 3,
                            endIndent: 3,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 90),
                              Text(':'),
                              SizedBox(width: 100),
                              Text('555'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 300.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(110, 114, 253, 0.9),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: 'Thank You!',
                                      titleStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      middleText:
                                          'Your order is completed. \n Please check delivery status at order tracking page.',
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color.fromRGBO(
                                                110, 114, 253, 0.9),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Ok',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ]);
                                },
                                child: const Text(
                                  'Checkout',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}

Widget mylistItem(Category category) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 180,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(138, 71, 241, 1.0),
                      Color.fromRGBO(138, 71, 241, 0.8156862745098039),
                      Colors.black87
                    ]),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 15, top: 5),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ]),
    );
