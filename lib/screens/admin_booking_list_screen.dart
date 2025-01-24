import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/admin_booking_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_booking_card.dart';
import 'package:pg/widgets/center_text.dart';
import 'package:pg/widgets/loader.dart';

class AdminBookingListScreen extends StatelessWidget {
  AdminBookingListScreen({super.key});

  final _adminBookingController = Get.put(AdminBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _adminBookingController.isLoading.value
            ? const Loader()
            : _adminBookingController.bookingsList.isEmpty
                ? CenterText(text: "No Bookings found")
                : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _adminBookingController.bookingsList.length,
                    itemBuilder: (context, index) {
                      final booking =
                          _adminBookingController.bookingsList[index];

                      return AdminBookingCard(booking: booking);
                    },
                  ),
      ),
    );
  }
}
