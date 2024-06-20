import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HeatMapCard extends StatefulWidget {
   Map<String, dynamic > dataset  ;
//   DateTime habitCreated ;
  String habitName = ' ';
  HeatMapCard({
    super.key,
     required this.dataset  ,
    required this.habitName,
    // required this.habitCreated
  });

  @override
  State<HeatMapCard> createState() => _HeatMapCardState();
}

class _HeatMapCardState extends State<HeatMapCard> {

  @override
  Widget build(BuildContext context) {


Map<String, dynamic> rawDataset = widget.dataset;
Map<DateTime, int> parsedDataset = {};

rawDataset.forEach((dateString, value) {
  DateTime parsedDate = DateTime.parse(dateString);
  parsedDataset[DateTime(parsedDate.year, parsedDate.month, parsedDate.day)] = value;
});

print(parsedDataset);

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HeatMap(
                    showColorTip: false,
                    startDate: DateTime.now(),
                    endDate: DateTime.now().add(Duration(days: 90)),
                    datasets: parsedDataset  , 
                    
                    colorMode: ColorMode.opacity,
                    // showText: false,
                    scrollable: true,
                    colorsets: {
                      13: const Color.fromARGB(255, 39, 176, 57),
                    },
                    onClick: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(value.toString())));
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                widget.habitName,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: Text("Streak : 10 "),
            )
          ]),
    );
  }
}
