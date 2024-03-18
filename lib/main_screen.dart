import 'package:flutter/material.dart';
import 'package:habit_tracker_app/util.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        children: [
          HabitTile(
            habitName: 'Exercise',
          ),
          HabitTile(
            habitName: 'Read',
          ),
          HabitTile(
            habitName: 'Meditate',
          ),
          HabitTile(
            habitName: 'Code',
          ),
        ],
      ),
    );
  }
}
