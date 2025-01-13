import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';

class AdminHomeCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const AdminHomeCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: AppColors.white,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
