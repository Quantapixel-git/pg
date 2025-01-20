import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';

class CenterText extends StatelessWidget {
  final String text;
  const CenterText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
