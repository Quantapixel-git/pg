import 'dart:io';
import 'package:get/get.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/models/booking_model.dart';
import 'package:pg/services/booking_services.dart';

class AdminBookingController extends GetxController {
  // States
  final isLoading = false.obs;

  // Inputs
  final selectedLocalImage = Rx<File?>(null);
  final bookingsList = RxList<BookingModel>();

  @override
  void onInit() {
    // TODO: implement onInit
    getAllBookings();
    super.onInit();
  }

  void getAllBookings() async {
    isLoading.value = true;

    bookingsList.clear();

    final res = await BookingServices.getAllBookings();

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (bookingsData) {
        bookingsList.addAll(bookingsData);
      },
    );
    isLoading.value = false;
  }
}
