import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';

class AdminRoomCard extends StatelessWidget {
  final String pgName;
  final String floorName;
  final String roomName;

  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;

  const AdminRoomCard({
    super.key,
    required this.roomName,
    required this.pgName,
    required this.floorName,
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
            Icons.square,
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
                  "Room: $floorName",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Floor: $floorName",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "PG: $pgName",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
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
