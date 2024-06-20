import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nanohabits/model/habit_model.dart';
import 'package:nanohabits/service/habit_service.dart';
import 'package:provider/provider.dart';


class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
   String colorChoosed = '' ; 
    String _selectedCategory ='' ; 
    int selectedIndexed =  -1 ; 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<String> _selectedDays = [] ; 

  List<String> category = [ 
      'Fitness' , 
      'meditaion' , 
      'study'
  ] ; 

  final List<DayInWeek> _days = [
    DayInWeek("mon", dayKey: "monday"),
    DayInWeek("tue", dayKey: "tuesday"),
    DayInWeek("wed", dayKey: "wednesday"),
    DayInWeek("thu", dayKey: "thursday"),
    DayInWeek("fri", dayKey: "friday"),
    DayInWeek("sat", dayKey: "saturday", isSelected: true),
    DayInWeek("sun", dayKey: "sunday", isSelected: true),
  ];



  @override
  Widget build(BuildContext context) {
    // final customWidgetKey = new GlobalKey<SelectWeekDaysState>();
 final  _habitService = Provider.of<HabitService>(context)  ; 


    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Habit name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              
              controller: _descriptionController,
              decoration: const InputDecoration(
              
                hintText: "Habit Description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField2<String>(
              
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // Add more decoration..
              ),
              hint: const Text(
                'select habit category',
                style: TextStyle(fontSize: 14),
              ),
              items: category.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      )) .toList(),
            
              validator: (value) {
                if (value == null) {
                  return 'Please select habit category.';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value.toString() ; 
                });
              },
              onSaved: (value) {
                _selectedCategory = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
             const SizedBox(height: 20),
            Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectWeekDays(
           
            fontSize: 14,
            fontWeight: FontWeight.w400,
            days: _days,
            border: false,
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blueGrey.shade800,

            ),
            onSelect: (values) { // <== Callback to handle the selected days
              setState(() {
                 _selectedDays = values ; 
              });
            
            },
          ),

        ),
      ),

      // color picker 


                  Container( 
        margin: EdgeInsets.all(10.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
          GestureDetector( onTap: (){ 
            setState(() {
             colorChoosed = "FFC6EBC5" ; 
             selectedIndexed = 0 ; 
            });
            
          }, child: Container( width: 30 , height: 30 , decoration: BoxDecoration(
            
            color: Color(0xFFC6EBC5) , 
          border: selectedIndexed == 0 ? Border.all(color: Colors.black , width: 2 ) : null ,
          borderRadius: BorderRadius.circular(15)
          ), child:Text(""),),) ,
         GestureDetector( onTap: (){ 
           setState(() {
             colorChoosed = "FFFFEFEF" ; 
              selectedIndexed = 1 ; 
            });
          
          }, child: Container( width: 30 , height: 30 , decoration: BoxDecoration(color: Color(0xFFFFEFEF) , 
           border: selectedIndexed == 1 ? Border.all(color: Colors.black , width: 2 ) : null ,
           borderRadius: BorderRadius.circular(15)
          ), child:Text(""),),) ,
           GestureDetector( onTap: (){ 
            setState(() {
             colorChoosed = "FFCDF5FD" ; 
              selectedIndexed = 2 ; 
            });
           
          }, child: Container( width: 30 , height: 30 , decoration: BoxDecoration(color: Color(0xFFCDF5FD) , 
            border: selectedIndexed == 2 ? Border.all(color: Colors.black , width: 2 ) : null ,
           borderRadius: BorderRadius.circular(15)
          ), child:Text(""),),) ,
           GestureDetector( onTap: (){ 
            setState(() {
             colorChoosed = "FFD0BFFF" ; 
              selectedIndexed = 3 ; 
            });
          
          }, child: Container( width: 30 , height: 30 , decoration: BoxDecoration(color: Color(0xFFD0BFFF) , 
            border: selectedIndexed == 3 ? Border.all(color: Colors.black , width: 2 ) : null ,
           borderRadius: BorderRadius.circular(15)
          ), child:Text(""),),) ,

        ],),
      ),


            Container(
              margin: EdgeInsets.only(top:20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  Colors.blueGrey.shade800, 
              ),
              child: TextButton(
                
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final title = _titleController.text;
                    final description = _descriptionController.text;

                    final habit = Habit( 
                      title: title,
                       description: description ,
                        category:_selectedCategory,
                        days: _selectedDays,
                       dataset: { 
                         
                        },
                        habitCreated: DateTime.now()  , 
                        colorChoosed : colorChoosed , 
                      
                        );
                  
final habitData = {
  'title': habit.title,
  'description': habit.description,
  'category': habit.category,
  'days': habit.days,
  'dataset': habit.dataset,
  'habitcreated': habit.habitCreated.toIso8601String(), // Convert DateTime to String
  'colorChoosed': habit.colorChoosed,
  'isCompleted': habit.isCompleted,
};

                    _habitService.createHabitInDb(habitData);

                   
                  }
                  
                },
                child:Text(
                  "Save Habit",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
