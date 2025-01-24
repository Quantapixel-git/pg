import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/room_model.dart';

class AdminRoomCard extends StatelessWidget {
  final RoomModel room;
  final String? adminRole;

  final Function(String? roomId) onDeleteTap;
  final Function(RoomModel room) onEditTap;

  const AdminRoomCard({
    super.key,
    required this.room,
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
                  "Room: ${room.name}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Floor: ${room.floorName}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "PG: ${room.pgName}",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Sharing: ${room.sharing}",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Price: Rs ${room.price} ",
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
                    onDeleteTap(room.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.danger,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onEditTap(room);
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
