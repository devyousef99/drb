import 'dart:ui';
import 'package:drb/checkout_page.dart';
import 'package:drb/news_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class article_page extends StatefulWidget {
  const article_page({Key? key}) : super(key: key);

  @override
  State<article_page> createState() => _article_pageState();
}

class _article_pageState extends State<article_page> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('assets/signin.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 28, top: 5),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 10, top: 5),
                      child: IconButton(
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(110, 114, 253, 0.9),
                              shape: BoxShape.circle),
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 20, top: 240),
                          child: const Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 240),
                          child: Text(
                            'ddaattee',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 200,
                      height: 50,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 25, top: 270),
                      child: const Text(
                        'title',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Align(
                              //   alignment: Alignment.bottomRight,
                              //   child: IconButton(
                              //     icon: const Icon(
                              //       Icons.star_border,
                              //       color: Colors.grey,
                              //     ),
                              //     onPressed: () {},
                              //   ),
                              // ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/signin.jpeg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.only(left: 10, top: 15),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 15),
                                child: Text(
                                  'writer"s name',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(110, 114, 253, 0.9),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, left: 20.0, bottom: 10.0),
                                child: Text(
                                  'ss',
                                  // passed_data.itemName.toString(),
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, bottom: 5.0, top: 5.0),
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
                                  'Comments',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(110, 114, 253, 0.9),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(110, 114, 253, 0.9),
                                      width: 2.0),
                                ),
                                hintText: 'Enter a comment',
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
