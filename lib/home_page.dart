import 'package:drb/drbCar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(Icons.hdr_auto_sharp),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.fill),
        ),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 180, right: 240),
            child: Text(
              'HOME',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          PreferredSize(
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
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                height: 246,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                right: 8, left: 8, top: 10, bottom: 10),
                            width: 320,
                            height: 180,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(88, 93, 249, 1.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/signin.jpeg'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(const DrbCarPage());
                                  },
                                  child: const Text(
                                    'DRB CAR',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
