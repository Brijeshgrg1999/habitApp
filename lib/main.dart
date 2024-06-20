import 'package:flutter/material.dart';
import 'package:nanohabits/service/habit_service.dart';
import 'package:nanohabits/themes/theme.dart';
import 'package:nanohabits/utils/routes.dart';
import 'package:nanohabits/view/bottom_navigation/entryapp.dart';
import 'package:provider/provider.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  // Create an instance of HabitService
  final habitService = HabitService();

  // Initialize the HabitService instance with habit data
  await habitService.getHabits();

  runApp(
    MultiProvider(providers:[ 
      ChangeNotifierProvider(create: (context)=>HabitService()),
    ],
    child: MyApp(

    ),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: AppTheme.mainTheme ,
        home: NavigationScreen(
          currentIndex: 0,
        ),
     ); 
  }
}


