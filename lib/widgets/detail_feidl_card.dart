import 'package:flutter/material.dart';

class DetailFeidlCard extends StatelessWidget {
  final String title;
  final String description;

  const DetailFeidlCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
