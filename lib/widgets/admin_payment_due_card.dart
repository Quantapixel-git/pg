import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/core/utils/date_time_utils.dart';
import 'package:pg/models/user_model.dart';

class AdminPaymentDueCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback onUnpaidTap;

  const AdminPaymentDueCard({
    super.key,
    required this.user,
    required this.onUnpaidTap,
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
                Wrap(
                  spacing: 10,
                  children: [
                    Text(
                      "PG Name:",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.pgName ?? "",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    Text(
                      "Floor No:",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.floorName ?? "",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    Text(
                      "Room No:",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.roomName ?? "",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    Text(
                      "Date of Joining:",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateTimeUtils.formatDate(user.dateOfJoining!),
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    Text(
                      "Date of Leaving:",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateTimeUtils.formatDate(user.dateOfLeaving!),
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
          GestureDetector(
            onTap: onUnpaidTap,
            child: Text(
              "Unpaid",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
