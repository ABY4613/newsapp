import 'package:flutter/material.dart';
import 'package:newsapp/utils/colors_const.dart';
import 'package:newsapp/view/bookmark_screen/bookmark_screen.dart';
import 'package:newsapp/view/category_screen/category_screen.dart';
import 'package:newsapp/view/home_screen/home_screen.dart';
import 'package:newsapp/view/profile_screen/profile_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedicon = 0;
  final List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    BookmarkPage(),
    ProfileScreen()
  ];                                                 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: screens[selectedicon],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedicon,
        selectedItemColor: ColorConstants.PRIMARY,
        unselectedItemColor: ColorConstants.BLACK,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedicon = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}






























// import 'package:ecommerce_clone_july/utils/color_constants.dart';
// import 'package:flutter/material.dart';

// class BottomNavigationBarScreen extends StatefulWidget {
//   const BottomNavigationBarScreen({super.key});

//   @override
//   State<BottomNavigationBarScreen> createState() =>
//       _BottomNavigationBarScreenState();
// }

// class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: ColorConstants.WHITE,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
//         onPressed: () {},
//       ),
//       bottomNavigationBar:
//           BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
//       ]),
//     );
//   }
// }
