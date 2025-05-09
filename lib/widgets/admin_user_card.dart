import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/user_model.dart';

class AdminUserCard extends StatelessWidget {
  final UserModel user;
  final String? adminRole;

  final Function(String? userId) onDeleteTap;
  final Function(UserModel user) onEditTap;

  const AdminUserCard({
    super.key,
    required this.user,
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
                  user.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "PG Name: ${user.pgName}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Floor: ${user.floorName}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Room: ${user.roomId}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
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
                    onDeleteTap(user.userId);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.danger,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onEditTap(user);
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
