

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HabitCompleted extends StatefulWidget {
  const HabitCompleted({super.key});

  @override
  State<HabitCompleted> createState() => _HabitCompletedState();
}

class _HabitCompletedState extends State<HabitCompleted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row( 
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text("COMPLETED" , style: Theme.of(context).textTheme.displayLarge,) , 
              Text("add notes on your completed habits",style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
      //      CircularStepProgressIndicator(
      //     totalSteps: 100,
      //     currentStep: 74,
      //     stepSize: 5,
      //     selectedColor: const Color.fromARGB(255, 6, 77, 43),
      //     unselectedColor: Colors.grey[200],
      //     padding: 0,
      //     width: 50,
      //     height: 50,
      //     selectedStepSize: 5,
      //     roundedCap: (_, __) => true,
      // ),
      
          // second row's child 
      
        ],
      ),
    ); 
  }
}