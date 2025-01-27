import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/download_data_controller.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/input.dart';

class AdminDownloadDataScreen extends StatefulWidget {
  const AdminDownloadDataScreen({super.key});

  @override
  State<AdminDownloadDataScreen> createState() =>
      _AdminDownloadDataScreenState();
}

class _AdminDownloadDataScreenState extends State<AdminDownloadDataScreen> {
  final _controller = Get.put(DownloadDataController());

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    _controller.updateDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Input(
            controller: _controller.dateController,
            label: "Select Date",
            readOnly: true,
            onTap: _selectDate,
          ),
          SizedBox(
            height: 20,
          ),
          Button(
            text: "Download Data",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
