import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pg/core/theme/app_colors.dart';

class AdminUserCard extends StatelessWidget {
  final String title;
  final String pgName;
  final int floorNumber;
  final int roomNumber;

  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;

  const AdminUserCard({
    super.key,
    required this.title,
    required this.pgName,
    required this.floorNumber,
    required this.roomNumber,
    this.onDeleteTap,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.user,
            size: 40,
            color: AppColors.primary,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "PG Name: $pgName",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Floor: $floorNumber",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Room: $roomNumber",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              IconButton(
                onPressed: onDeleteTap,
                icon: Icon(
                  Icons.delete,
                  color: AppColors.danger,
                ),
              ),
              IconButton(
                onPressed: onEditTap,
                icon: Icon(Icons.edit),
              ),
            ],
          )
        ],
      ),
    );
  }
}
