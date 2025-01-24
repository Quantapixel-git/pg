import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/floor_model.dart';

class AdminFloorCard extends StatelessWidget {
  final FloorModel floor;
  final String? adminRole;

  final Function(String? floorId) onDeleteTap;
  final Function(FloorModel floor) onEditTap;

  const AdminFloorCard({
    super.key,
    required this.floor,
    required this.onDeleteTap,
    required this.onEditTap,
    required this.adminRole,
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
                  "Floor: ${floor.name}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "PG: ${floor.pgName}",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (adminRole == "admin")
            Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    onDeleteTap(floor.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.danger,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onEditTap(floor);
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            )
        ],
      ),
    );
  }
}
