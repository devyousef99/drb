import 'package:drb/drbCar_page.dart';
import 'package:drb/favorite_page.dart';
import 'package:drb/profile_page.dart';
import 'package:drb/signup.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class Category {
  String name, image;
  Category({required this.name, required this.image});
}

//Custom list to show the data.
class artistsData {
  final List<Category> _myList = <Category>[
    Category(name: 'artist1', image: 'assets/log_in.png'),
    Category(name: 'artist1', image: 'assets/log_in.png'),
  ];
  List<Category> get myList => _myList;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = true]) {
    if (end) {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Category> _artistsList = artistsData().myList;
    return SideMenu(
      closeIcon: const Icon(
        Icons.close_rounded,
        color: Colors.black,
        size: 16,
      ),
      key: _sideMenuKey,
      menu: buildMenu(),
      background: Colors.transparent,
      type: SideMenuType.slide,
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: IgnorePointer(
        ignoring: isOpened,
        child: Scaffold(
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
                    onPressed: () => toggleMenu()),
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
          body: Container(
            height: (MediaQuery.of(context).size.height),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'), fit: BoxFit.fill),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 80, right: 240),
                    child: Text(
                      'HOME',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: _artistsList.length,
                          itemBuilder: (BuildContext context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              columnCount: 2,
                              position: index,
                              child: mylistItem(_artistsList[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: _artistsList.length,
                          itemBuilder: (BuildContext context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              columnCount: 2,
                              position: index,
                              child: mylistItem(_artistsList[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        // height: (MediaQuery.of(context).size.height),
                        width: (MediaQuery.of(context).size.width),
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
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 8, left: 8, top: 10, bottom: 10),
                                  // width: 330,
                                  // height: 130,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color.fromRGBO(88, 93, 249, 1.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/signin.jpeg'),
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
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
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
        ),
      ),
    );
  }

  Widget buildMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, John Doe",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(ProfilePage());
            },
            leading: const Icon(
              Icons.person_outlined,
              size: 20.0,
              color: Color.fromRGBO(88, 93, 249, 1.0),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Get.to(ProfilePage());
            },
            leading: const Icon(
              Icons.notifications,
              size: 20.0,
              color: Color.fromRGBO(88, 93, 249, 1.0),
            ),
            title: const Text(
              "Notfactions",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Get.to(Favorite());
            },
            leading: const Icon(
              Icons.favorite,
              size: 20.0,
              color: Color.fromRGBO(88, 93, 249, 1.0),
            ),
            title: const Text(
              "Favorites",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.track_changes_rounded,
              size: 20.0,
              color: Color.fromRGBO(88, 93, 249, 1.0),
            ),
            title: const Text(
              "Tracking",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.store_rounded,
              size: 20.0,
              color: Color.fromRGBO(88, 93, 249, 1.0),
            ),
            title: const Text(
              "My Store",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.help_rounded,
              size: 20.0,
              color: Color.fromRGBO(88, 93, 249, 1.0),
            ),
            title: const Text(
              "Help",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Get.to(SignUpPage());
            },
            leading: const Icon(
              Icons.logout,
              size: 20.0,
              color: Color.fromRGBO(88, 93, 249, 1.0),
            ),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
        ],
      ),
    );
  }
}

Widget mylistItem(Category category) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 183,
            height: 160,
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
          // const SizedBox(
          //   height: 5,
          // ),
        ],
      ),
    );
