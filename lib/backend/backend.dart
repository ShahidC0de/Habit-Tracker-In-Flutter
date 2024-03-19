import 'package:flutter/material.dart';

class Backend extends ChangeNotifier {
  List<List<dynamic>> habitsLists = [
    //[ habitName, hasHabitStarted, timespend(sec), timegoal(mins) ]
    ['Exercise', false, 4, 12],
    ['Read', false, 2, 30],
    ['Meditate', false, 5, 32],
    ['Code', false, 10, 15],
  ];
  void hasHabitStarted(int index) {
    habitsLists[index][1] = !habitsLists[index][1];
    notifyListeners();
  }

  void settingsOpened(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Settings for ${habitsLists[index][0]}"),
          );
        });
  }
}
