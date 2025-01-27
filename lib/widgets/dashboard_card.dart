import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Color backgroundColor;
  final Color forgroundColor;
  final String title;
  final String count;

  const DashboardCard({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.count,
    required this.forgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: forgroundColor,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: 25,
              color: forgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
