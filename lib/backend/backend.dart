import 'dart:async';

import 'package:flutter/material.dart';

class Backend extends ChangeNotifier {
  List<List<dynamic>> habitsLists = [
    //[ habitName, hasHabitStarted, timespend(sec), timegoal(mins) ]
    ['Exercise', false, 6, 12],
    ['Read', false, 2, 30],
    ['Meditate', false, 5, 32],
    ['Code', false, 10, 15],
  ];
  void hasHabitStarted(int index) {
    var startTime = DateTime.now();
    var elapsedTime = habitsLists[index][2];

    habitsLists[index][1] = !habitsLists[index][1];
    notifyListeners();
    if (habitsLists[index][1]) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!habitsLists[index][1]) {
          timer.cancel();
          notifyListeners();
        }
        var currentTime = DateTime.now();
        habitsLists[index][2] = elapsedTime +
            currentTime.second -
            startTime.second +
            60 * (currentTime.minute - startTime.minute) +
            60 * 60 * (currentTime.hour - startTime.hour);
        notifyListeners();
      });
    }
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
