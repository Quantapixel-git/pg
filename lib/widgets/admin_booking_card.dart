import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/booking_model.dart';

class AdminBookingCard extends StatelessWidget {
  final BookingModel booking;

  const AdminBookingCard({
    super.key,
    required this.booking,
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
                  booking.customerName ?? "Name",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "PG Name: ${booking.pgName}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Floor: ${booking.floorName}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Room: ${booking.roomName}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Booking Status: ${booking.booked}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Phone: ${booking.customerMobile}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "Address: ${booking.customerAddress}",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
