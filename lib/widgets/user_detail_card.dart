import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/core/utils/date_time_utils.dart';
import 'package:pg/models/user_model.dart';
import 'package:pg/widgets/detail_feidl_card.dart';

class UserDetailCard extends StatelessWidget {
  final UserModel user;

  const UserDetailCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.warning,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text.rich(
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    TextSpan(
                      text:
                          "Your payment for PG is due soon! Don’t forget to complete your payment by ",
                      children: [
                        TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            text:
                                "${DateTimeUtils.formatDate(DateTime.now())}. "),
                        TextSpan(
                            text: "Avoid any late fees and stay on track! "),
                        TextSpan(
                            text: "Click to Pay ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          CircleAvatar(
            backgroundColor: AppColors.primary.withValues(alpha: 0.2),
            radius: 50,
            child: Icon(
              Icons.person,
              color: AppColors.primary,
              size: 60,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            user.name,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Age : ${user.age}",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 50,
            crossAxisSpacing: 16,
            children: [
              DetailFeidlCard(title: "Address", description: user.address),
              DetailFeidlCard(
                  title: "Designation", description: user.designation),
              DetailFeidlCard(title: "Phone", description: user.mobile),
              DetailFeidlCard(title: "Email", description: user.email),
              DetailFeidlCard(
                title: "Pg Name",
                description: user.pgName.toString(),
              ),
              DetailFeidlCard(
                title: "Floor No",
                description: user.floorName.toString(),
              ),
              DetailFeidlCard(
                title: "Room No",
                description: user.roomName.toString(),
              ),
              DetailFeidlCard(
                title: "Aadhar No",
                description: user.aadharNumber,
              ),
              DetailFeidlCard(
                title: "Date of Joining",
                description: DateTimeUtils.formatDate(user.dateOfJoining!),
              ),
              DetailFeidlCard(
                title: "Date of Leaving",
                description: DateTimeUtils.formatDate(user.dateOfLeaving!),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
