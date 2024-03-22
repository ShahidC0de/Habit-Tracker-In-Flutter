import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback settingTapped;
  final int goalTime;
  final bool hasHabitStarted;
  final int spendTime;

  const HabitTile({
    super.key,
    required this.habitName,
    required this.onTap,
    required this.settingTapped,
    required this.goalTime,
    required this.hasHabitStarted,
    required this.spendTime,
  });
  String formatIntoSeconds(int totalSeconds) {
    String secs = (totalSeconds % 60).toString();
    String mins = (totalSeconds / 60).toStringAsFixed(0);
    if (mins[1] == '.') {
      mins = mins.substring(0, 1);
    }
    return '$mins:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 12.0, bottom: 6.0, left: 12.0, right: 12.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Stack(
                        children: [
                          Center(
                            child: CircularPercentIndicator(
                              radius: 20,
                            ),
                          ),
                          Center(
                            child: Icon(hasHabitStarted
                                ? Icons.pause
                                : Icons.play_arrow),
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habitName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      ' $formatIntoSeconds(spendTime)/$goalTime'.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: settingTapped,
              child: const Icon(
                Icons.settings,
              ),
            )
          ],
        ),
      ),
    );
  }
}
