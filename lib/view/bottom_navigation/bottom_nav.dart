import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex ; 
  final Function(int) onTap ; 

  const BottomNav({super.key , 
  required this.currentIndex , required this.onTap});

  @override
  State<BottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return  Container( 
      child :  BottomNavigationBar( 
        currentIndex: widget.currentIndex ,
        type: BottomNavigationBarType.fixed,
        onTap: widget.onTap,
        items: [ 
          BottomNavigationBarItem(
            activeIcon: Padding( 
            padding: EdgeInsets.all(5), 
            child: Icon(FontAwesomeIcons.house , color: Colors.green,),
          ) ,
            icon: Padding( 
            padding: EdgeInsets.all(5), 
            child: Icon(FontAwesomeIcons.house , color: Colors.grey,),
          ),
          label: '' , 
          
          ),
          BottomNavigationBarItem(
            activeIcon: Padding( 
            padding: EdgeInsets.all(5), 
            child: Icon(FontAwesomeIcons.plus , color: Colors.green,),
          ) ,
            icon: Padding( 
            padding: EdgeInsets.all(5), 
            child: Icon(FontAwesomeIcons.plus , color: Colors.grey,),
          ),
          label: ''
          
          ),
           BottomNavigationBarItem(
            activeIcon: Padding( 
            padding: EdgeInsets.all(5), 
            child: Icon(FontAwesomeIcons.arrowUp , color: Colors.green,),
          ) ,
            icon: Padding( 
            padding: EdgeInsets.all(5), 
            child: Icon(FontAwesomeIcons.arrowUp , color: Colors.grey,),
          ),
          label: ''
          
          )
        ],
      )
    ) ; 
  }
}