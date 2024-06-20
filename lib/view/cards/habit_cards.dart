import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanohabits/service/habit_service.dart';
import 'package:provider/provider.dart';



class habitCard extends StatefulWidget {
  final dynamic habit;
  // final Color colorChoosed ; 
  const habitCard({super.key, required this.habit , 
  // required this.colorChoosed
   });

  @override
  State<habitCard> createState() => _habitCardState();
}

class _habitCardState extends State<habitCard> {
  @override
  Widget build(BuildContext context) {
    final title = widget.habit['title'];
    final description = widget.habit['description'];
    final id = widget.habit['_id']; // Corrected line
    // final colorChoosed = widget.habit['colorChoosed']   ; 
     final colorChoosed = widget.habit['colorChoosed'] ?? 'FF000000'; // Default to black color

  

    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      color: Color(int.parse(colorChoosed, radix: 16)),
      ),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // softWrap: true,
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:Theme.of(context).textTheme.titleLarge
                  ),
                  Text(
                    description.toString(),
                    overflow: TextOverflow.ellipsis,
                    style:Theme.of(context).textTheme.labelLarge
                  ),
                ]),
          ),
          Row( 
            children: [ 
              IconButton(
              onPressed: () {
                Provider.of<HabitService>(context, listen: false)
                    .deleteHabit(id);
              },
              icon: Icon(FontAwesomeIcons.trash)),
              IconButton(
              onPressed: () {
                Provider.of<HabitService>(context, listen: false)
                    .setCompletedHabit(id);
              },
              icon: Icon(FontAwesomeIcons.circleCheck))
            ],
          )
          
        ],
      ),
    );
  }
}
