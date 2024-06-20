import 'package:flutter/material.dart';
import 'package:nanohabits/service/habit_service.dart';
import 'package:nanohabits/view/cards/heatmap_cards.dart';
import 'package:provider/provider.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {

   

  @override
  void initState() {
    super.initState();
Provider.of<HabitService>(context, listen: false).getHabits() ; 

  }


@override
Widget build(BuildContext context) {
  return Consumer<HabitService>(builder: (context, habitService, child){ 
     final habitForGraphs = habitService.showHabit ; 
     if(habitForGraphs.isEmpty){
      return Center( child : CircularProgressIndicator()) ; 
     }

     return ListView.builder(
      itemCount: habitForGraphs.length,
      itemBuilder: (context , index){
        final habit = habitForGraphs[index] ; 
          final Map<String, dynamic> datasetMap = habit ["dataset"] ?? {};
            return HeatMapCard(
                      dataset: datasetMap,
                      habitName: habit['title'] ?? '',
                    );
      }
       )  ; 

  },) ; 
 
}
}