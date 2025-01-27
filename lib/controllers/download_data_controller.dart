import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/utils/date_time_utils.dart';

class DownloadDataController extends GetxController {
  final selectedDate = Rx<DateTime?>(null);

  final dateController = TextEditingController();

  void updateDate(DateTime? dateTime) {
    if (dateTime != null) {
      dateController.text = DateTimeUtils.formatDate(dateTime!);
      selectedDate.value = dateTime;
    }
  }
}
