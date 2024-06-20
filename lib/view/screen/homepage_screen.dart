import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:nanohabits/service/habit_service.dart';
import 'package:nanohabits/view/cards/habitCompleted_card.dart';
// import 'package:nanohabits/view/cards/habitCompleted_card.dart';
import 'package:nanohabits/view/cards/habit_cards.dart';
import 'package:nanohabits/view/cards/habit_counter.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HabitService>(context, listen: false).getHabits();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String weekdayString = DateFormat('EEEE').format(now).toLowerCase();

    return Consumer<HabitService>(
      builder: (context, habitService, child) {
        
      //  print(habitCompleted) ; 
        final habits = habitService.showHabit;
        final habitsCompleted = habitService.completedHabits ; 
        final habitFinal = habits
            .where((habit) =>
                habit['days'] is List &&
                (habit['days'] as List<dynamic>)
                    .any((day) => day.toString().toLowerCase() == weekdayString))
            .toList();

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HabitCounter(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final habit = habitFinal[index];
                  return habitCard(habit: habit);
                },
                childCount: habitFinal.length,
              ),
            ),
             SliverToBoxAdapter(
              child: HabitCompleted(),
            ),
SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final habit = habitFinal[index];
                  if(habit['isCompleted'] == true)
                  return habitCard(habit: habit);
                },
                childCount: habitFinal.length,
              ),
            ),
          ],
        );
      },
    );
  }
}