import 'package:flutter/material.dart';

class Habit {
  String title;
  String description;
  String category;
  List<String> days;
  Map<String, int> dataset ;
  DateTime habitCreated;
  String colorChoosed; // Use colorChoosed instead of colorHex
  bool isCompleted ;

  Habit({
    required this.title,
    required this.description,
    required this.category,
    required this.days,
    required this.dataset,
    required this.habitCreated,
    required this.colorChoosed, // Pass the hexadecimal color value
     this.isCompleted = false , 
  });

  // Helper method to convert the hexadecimal string to a Color object
  Color get color => Color(int.parse(colorChoosed, radix: 16));



  
}