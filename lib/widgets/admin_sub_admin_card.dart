import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/sub_admin_model.dart';

class AdminSubAdminCard extends StatelessWidget {
  final SubAdminModel subAdmin;

  final Function(String? userId) onDeleteTap;
  final Function(SubAdminModel user) onEditTap;

  const AdminSubAdminCard({
    super.key,
    required this.subAdmin,
    required this.onDeleteTap,
    required this.onEditTap,
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
                  subAdmin.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: AppColors.gray,
                      size: 20,
                    ),
                    Text(
                      subAdmin.mobile,
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              IconButton(
                onPressed: () {
                  onDeleteTap(subAdmin.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: AppColors.danger,
                ),
              ),
              IconButton(
                onPressed: () {
                  onEditTap(subAdmin);
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
