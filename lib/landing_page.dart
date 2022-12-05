// ignore_for_file: unused_import, use_full_hex_values_for_flutter_colors
import 'package:drb/profile_page.dart';
import 'package:drb/signin_page.dart';
import 'package:drb/store_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'events_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';
import 'news_page.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const Store(),
    const EventPage(),
    const NewsPage()
  ];
  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  toggleMenu([bool end = true]) {
    if (end) {
      final state = _sideMenuKey.currentState!;
      if (state.isOpened) {
        state.closeSideMenu();
      } else {
        state.openSideMenu();
      }
    }
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xfff4f489e),
        title: Image.asset(
          'assets/LOGO3.png',
          fit: BoxFit.cover,
          matchTextDirection: true,
          alignment: Alignment.center,
          width: 90,
        ),
        centerTitle: true,
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
      ),
      body: SideMenu(
        key: _sideMenuKey,
        menu: buildMenu(),
        background: Colors.white,
        type: SideMenuType.slide,
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: IgnorePointer(
          ignoring: isOpened,
          child: Scaffold(
            body: PageStorage(
              bucket: bucket,
              child: currentScreen,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xfff5fbb46),
              child: const Icon(
                Icons.home,
              ),
              onPressed: () {
                setState(() {
                  currentScreen = const HomePage();
                  currentTab = 0;
                });
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = const NewsPage();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.library_books_rounded,
                                color: currentTab == 1
                                    ? const Color(0xfff4f489e)
                                    : Colors.grey,
                              ),
                              Text(
                                'News',
                                style: TextStyle(
                                  color: currentTab == 1
                                      ? const Color(0xfff4f489e)
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.menu_book_rounded,
                                color: currentTab == 2
                                    ? const Color(0xfff4f489e)
                                    : Colors.grey,
                              ),
                              Text(
                                'Resources',
                                style: TextStyle(
                                  color: currentTab == 2
                                      ? const Color(0xfff4f489e)
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = const EventPage();
                              currentTab = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.event,
                                color: currentTab == 3
                                    ? const Color(0xfff4f489e)
                                    : Colors.grey,
                              ),
                              Text(
                                'Events',
                                style: TextStyle(
                                  color: currentTab == 3
                                      ? const Color(0xfff4f489e)
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = const Store();
                              currentTab = 4;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.store,
                                color: currentTab == 4
                                    ? const Color(0xfff4f489e)
                                    : Colors.grey,
                              ),
                              Text(
                                'Store',
                                style: TextStyle(
                                  color: currentTab == 4
                                      ? const Color(0xfff4f489e)
                                      : Colors.grey,
                                ),
                              ),
                            ],
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
      ),
    );
  }

  Widget buildMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            // Get.to(ProfilePage());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
          leading: const Icon(Icons.person_outlined,
              size: 20.0, color: Color(0xfff4f489e)),
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
        ListTile(
          onTap: () {
            // Get.to(ProfilePage());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
          leading: const Icon(Icons.notifications,
              size: 20.0, color: Color(0xfff4f489e)),
          title: const Text(
            "Notfactions",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
        ListTile(
          onTap: () {
            // Get.to(Favorite());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Favorite()),
            );
          },
          leading:
              const Icon(Icons.favorite, size: 20.0, color: Color(0xfff4f489e)),
          title: const Text(
            "Favorites",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.track_changes_rounded,
              size: 20.0, color: Color(0xfff4f489e)),
          title: const Text(
            "Tracking",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.store_rounded,
              size: 20.0, color: Color(0xfff4f489e)),
          title: const Text(
            "My Store",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.abc_rounded,
              size: 20.0, color: Color(0xfff4f489e)),
          title: const Text(
            "Arabic",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.help_rounded,
              size: 20.0, color: Color(0xfff4f489e)),
          title: const Text(
            "Help",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
        ListTile(
          onTap: () {
            // Get.to(SignUpPage());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
          leading:
              const Icon(Icons.logout, size: 20.0, color: Color(0xfff4f489e)),
          title: const Text(
            "Logout",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
      ],
    );
  }
}
