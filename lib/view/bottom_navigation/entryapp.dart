import 'package:flutter/material.dart';

import 'package:nanohabits/view/bottom_navigation/bottom_nav.dart';
import 'package:nanohabits/view/screen/addhabit_screen.dart';
import 'package:nanohabits/view/screen/heatmap_screen.dart';
import 'package:nanohabits/view/screen/homepage_screen.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({required this.currentIndex});
  int currentIndex;
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

const List<Widget> screens = [
  MainScreen(),
  AddHabitScreen(),
  GraphScreen(),
 // ProfilePage()
];

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      centerTitle: true,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
      Text('NANO HABITS' , style:Theme.of(context).textTheme.displayLarge) ,
      SizedBox(width: 20,),
      Image.asset('assets/icons/nanotechnology.png', width: 40, height: 40,)
     ],)),
      body: IndexedStack(
        index: widget.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: widget.currentIndex,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_photos_rounded), label: "Add habits"),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "progress"),
           BottomNavigationBarItem(icon: Icon(Icons.person), label: "notification")
        ],
      ),
    );
  }
}