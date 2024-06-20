import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:nanohabits/repos/mongodb_connection.dart';

class HabitService extends ChangeNotifier {
  // list to store habits
  List<Map<String, dynamic>> _habits = [];

  // method to get habits
  List<Map<String, dynamic>> get showHabit => _habits;

  // list to store habits
  List<Map<String, dynamic>> _completedHabits = [];

  // method to get habits
  List<Map<String, dynamic>> get completedHabits => _completedHabits;

  // initializing the mongo db connection
  final mongodbConnection instance = mongodbConnection();


  Future<List<Map<String, dynamic>>> getHabits() async {
    final db = await instance.Connection();
    final habitCollection = db.collection('habits');
    final habitData = await habitCollection.find().toList();
    await db.close();
    _habits = habitData;
    notifyListeners() ; 
    return habitData;
    
  }

Future<void> deleteHabit(String id) async {
    final db = await instance.Connection();
    final habitsCollection = db.collection('habits');

    await habitsCollection.deleteOne({"_id": id});
    _habits = await getHabits(); // Update the habits list
// Notify the stream with updated habits
    await db.close();

    notifyListeners();
    print("delete");
}


  Future<void> deleteALL() async {
    final db = await instance.Connection();

    await db.collection('habits').deleteMany({});
    await db.close();
    _habits = await getHabits(); // Update the habits list and notify the stream
    notifyListeners();
  }

  Future<void> createHabitInDb(Map<String, dynamic> habit) async {
    final db = await instance.Connection();
    final habitsCollection = db.collection('habits');
    final habitObject = {
      '_id': ObjectId().oid, // Convert ObjectId to String
      ...habit, // Spread the habitData map
    };
    await habitsCollection.insertOne(habitObject);

    await db.close();
    _habits = await getHabits();
    notifyListeners() ; 
  }

  Future<void> setCompletedHabit(String id) async {
    final db = await instance.Connection();
    final collection = db.collection('habits');
    final dateKey = DateTime.now().toIso8601String();

    // Get the existing habit document
    final habitDoc = await collection.findOne(where.eq('_id', id));

    // Get the existing dataset or create a new one if it doesn't exist
    final Map<String, dynamic> existingDataset = habitDoc?['dataset'] ?? {};

    // Update the existing dataset with the new data
    final Map<String, dynamic> updatedDataset = {
      ...existingDataset,
      dateKey: 13, // Add the new data for the current date
    };

    // Update the habit document with the updated dataset and isCompleted flag
    await collection.updateOne(
      where.eq('_id', id),
      modify.set('isCompleted', true).set('dataset', updatedDataset),
    );

    await db.close();
    _habits = await getHabits(); // Update the habits list and notify the stream
    notifyListeners();
   
  }




  Future<List<Map<String, dynamic>>> showCompletedHabits() async {
    final db = await instance.Connection();
    final habitCollection = db.collection('habits');
    final habitData = await habitCollection.find().toList();
    await db.close();
    _completedHabits = habitData;
    notifyListeners() ; 
    return habitData;
    
  }




}
