import 'package:drb/Modules/clients.dart';
import 'package:drb/drbCar_page.dart';
import 'package:drb/favorite_page.dart';
import 'package:drb/profile_page.dart';
import 'package:drb/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:http/http.dart' as http;

class Category {
  String name, image;
  Category({required this.name, required this.image});
}

//Custom list to show the data.
// ignore: camel_case_types
class artistsData {
  final List<Category> _myList = <Category>[
    Category(name: 'artist1', image: 'assets/log_in.png'),
    Category(name: 'artist1', image: 'assets/log_in.png'),
  ];
  List<Category> get myList => _myList;
}

Future<Clients> user() async {
  var jsonresponse;
  final response = await http.get(
    Uri.parse('https://drbdesignksa.daftra.com/api2/clients'),
    headers: {
      'Content-Type': 'application/json',
      'APIKEY': '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4',
      'Cookie':
          'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
    },
  );
  if (response.statusCode == 200 || response.statusCode == 202) {
    jsonresponse = response.body;
    print('successful: $jsonresponse');
  }
  return Clients.fromJson(jsonresponse);
}

@override
void initState() {
  user();
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
      final state = _sideMenuKey.currentState!;
      if (state.isOpened) {
        state.closeSideMenu();
      } else {
        state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Category> artistsList = artistsData().myList;
    return Scaffold(
      body: Container(
        height: (MediaQuery.of(context).size.height),
        color: const Color(0xfff4f489e),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 265),
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
                      itemCount: artistsList.length,
                      itemBuilder: (BuildContext context, index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          child: mylistItem(artistsList[index]),
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
                      itemCount: artistsList.length,
                      itemBuilder: (BuildContext context, index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          child: mylistItem(artistsList[index]),
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
                                color: Color(0xfff4f489e),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
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
                                      // Get.to(const DrbCarPage());
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DrbCarPage()),
                                      );
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
                SizedBox(height: 16.0),
                Text(
                  '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 20.0),
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
            leading: const Icon(
              Icons.person_outlined,
              size: 20.0,
              color: Color(0xfff6c0ba9),
            ),
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
            leading: const Icon(
              Icons.notifications,
              size: 20.0,
              color: Color(0xfff6c0ba9),
            ),
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
            leading: const Icon(
              Icons.favorite,
              size: 20.0,
              color: Color(0xfff6c0ba9),
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
              color: Color(0xfff6c0ba9),
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
              color: Color(0xfff6c0ba9),
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
              Icons.abc_rounded,
              size: 20.0,
              color: Color(0xfff6c0ba9),
            ),
            title: const Text(
              "Arabic",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.help_rounded,
              size: 20.0,
              color: Color(0xfff6c0ba9),
            ),
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
            leading: const Icon(
              Icons.logout,
              size: 20.0,
              color: Color(0xfff6c0ba9),
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
