import 'package:flutter/material.dart';

class AppTheme {
  AppTheme(); // this makes the class singleton

  static final ThemeData mainTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    textTheme: const TextTheme(


      displayLarge: TextStyle(
        fontFamily: 'Gilroy-Bold',
        fontWeight: FontWeight.w900,
        fontSize: 22.0,
      ),


      displayMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        fontSize: 21.0,
      ),


    displaySmall: TextStyle(
        fontFamily: 'Gilroy-Bold',
        fontWeight: FontWeight.w700,
        fontSize: 15.0,
      ),

     labelSmall : TextStyle(
        fontFamily: 'Gilroy-light',
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 193, 187, 187),
        fontSize: 14.0,
      ),

      titleMedium: TextStyle(
          fontFamily: 'Gilroy',
        fontWeight: FontWeight.w900,
        fontSize: 24.0,
        color: Colors.grey,

      ),
      titleLarge: TextStyle(
        fontFamily: 'Gilroy-Bold',
        fontWeight: FontWeight.w800,
        fontSize: 25.0,
        height: 1.2,
      ) ,
      titleSmall: TextStyle(
         fontFamily: 'Gilroy-Light',
        fontWeight: FontWeight.normal,
        fontSize: 13.0,
       
      ),
      
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black),
      bodyMedium: TextStyle(
        fontSize: 16.0, 
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'Gilroy-Light',
        height: 1.1,
        ),
      bodySmall: TextStyle(
        fontSize: 10.0, 
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontFamily: 'Gilroy-Light',
        height: 1.0,
        
      ),


      // Define other text styles...
    ),

    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    // Define other theme properties...
  );

  // // You can also define a dark theme if you want
  // static final ThemeData darkTheme = ThemeData(
  //   primarySwatch: Colors.blue,
  //   brightness: Brightness.dark,
  //   // Define other theme properties...
  // );
}
