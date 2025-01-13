import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/enums/direction.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final swipeSequence = <Direction>[].obs;

  void handleSwipe(Direction direction) {
    print(direction);
    setState(() {
      swipeSequence.add(direction);

      if (swipeSequence.length > 4) {
        swipeSequence.removeAt(0);
      }

      if (swipeSequence.length == 2 &&
          swipeSequence[0] == Direction.left &&
          swipeSequence[1] == Direction.right &&
          swipeSequence[2] == Direction.up &&
          swipeSequence[3] == Direction.down) {
        print("Navigation to Admin Panel");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.localPosition.dx < 0) {
            // Swipe left

            handleSwipe(Direction.left);
          }
          if (details.localPosition.dx > 0) {
            // Swipe Right

            handleSwipe(Direction.right);
          }
          if (details.localPosition.dy < 0) {
            // Swipe Up

            handleSwipe(Direction.up);
          }
          if (details.localPosition.dy > 0) {
            // Swipe Down

            handleSwipe(Direction.down);
          }
        },
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
