// ignore_for_file: unused_import
import 'package:drb/store_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'events_page.dart';
import 'home_page.dart';
import 'news_page.dart';

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

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfff03d000),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                              ? const Color(0xfff6c0ba9)
                              : Colors.grey,
                        ),
                        Text(
                          'News',
                          style: TextStyle(
                            color: currentTab == 1
                                ? const Color(0xfff6c0ba9)
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
                              ? const Color(0xfff6c0ba9)
                              : Colors.grey,
                        ),
                        Text(
                          'Resources',
                          style: TextStyle(
                            color: currentTab == 2
                                ? const Color(0xfff6c0ba9)
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
                              ? const Color(0xfff6c0ba9)
                              : Colors.grey,
                        ),
                        Text(
                          'Events',
                          style: TextStyle(
                            color: currentTab == 3
                                ? const Color(0xfff6c0ba9)
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
                              ? const Color(0xfff6c0ba9)
                              : Colors.grey,
                        ),
                        Text(
                          'Store',
                          style: TextStyle(
                            color: currentTab == 4
                                ? const Color(0xfff6c0ba9)
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
    );
  }
}
