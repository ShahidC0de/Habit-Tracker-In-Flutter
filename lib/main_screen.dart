import 'package:flutter/material.dart';
import 'package:habit_tracker_app/backend/backend.dart';
import 'package:habit_tracker_app/utilities/util.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Backend backend = Provider.of<Backend>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Consistency Is The Key',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
          itemCount: backend.habitsLists.length,
          itemBuilder: (context, index) {
            return HabitTile(
              habitName: backend.habitsLists[index][0],
              onTap: () {
                setState(() {
                  backend.hasHabitStarted(index);
                });
              },
              settingTapped: () {
                backend.settingsOpened(context, index);
              },
              goalTime: backend.habitsLists[index][3],
              hasHabitStarted: backend.habitsLists[index][1],
              spendTime: backend.habitsLists[index][2],
            );
          }),
    );
  }
}
