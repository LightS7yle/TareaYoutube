import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/pages/home_page.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';


class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    Text("hola"),
    Text("2"),
    Text("hola"),
    Text("2"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cast,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                Positioned(
                  top: -2,
                  right: -4,
                  child: Container(
                    padding: EdgeInsets.all(2.4),
                    child: Text(
                      "9+",
                      style: TextStyle(fontSize: 11),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),

          const SizedBox(
            width: 6,
          ),
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white12,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaXaKH9Q7gVGHSc2_IK3mOhpEaiULsMGxwRUe2nL4b&s"),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
        backgroundColor: kBrandPrimaryColor,
        title: Image.asset(
          "assets/images/logo.png",
          height: 26,
        ),
      ),
      body: _pages[_currentIndex],
      backgroundColor: kBrandPrimaryColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrandPrimaryColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Principal",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Shorts",
            icon: Icon(Icons.play_arrow_rounded),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.add_circle_outline,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Suscripciones",
            icon: Icon(Icons.subscriptions_rounded),
          ),
          BottomNavigationBarItem(
            label: "Bilioteca",
            icon: Icon(Icons.video_collection_rounded),
          ),
        ],
      ),
    );
  }
}
