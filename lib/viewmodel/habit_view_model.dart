
// import 'package:flutter/material.dart';
// import 'package:nanohabits/service/habit_service.dart';
// import 'package:provider/provider.dart';

// class HabitViewModel extends ChangeNotifier{
//   final HabitService _habitService = HabitService() ; 

//   List<Map<String , dynamic>> _habits=[] ; 
//    List<Map<String , dynamic>> get allHabits => _habits ; 

//   String? errorMessage ; 
  
//   Future<void> fetchHabits() async{
//     final response = await _habitService.getHabitsFromDb() ;
//     if(response.isSuccess){
//       _habits = response.data ?? [] ; 
//       errorMessage = null ; 
//     } else {
//       errorMessage = response.error?.message ; 
//     }
//       notifyListeners() ; 
//   }
 

//   Future<void> deleteAll() async {
//     final response = await _habitService.deleteAllFromDb() ; 
//     if(response.isSuccess){
//       await fetchHabits() ; 
//       errorMessage = null ; 
//     }else{
//       errorMessage = response.error?.message ; 
//     }
//       notifyListeners() ; 
//   }




// }