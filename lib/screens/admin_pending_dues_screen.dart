import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/user_model.dart';
import 'package:pg/widgets/admin_payment_due_card.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/image_field.dart';
import 'package:pg/widgets/input.dart';

class AdminPendingDuesScreen extends StatelessWidget {
  const AdminPendingDuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return AdminPaymentDueCard(
          onUnpaidTap: () {
            Get.bottomSheet(
              isScrollControlled: true,
              backgroundColor: AppColors.white,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Update Payment Status",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Payment Status",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.dark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    DropdownMenu(
                      width: Get.width,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: "unpaid",
                          label: "Unpaid",
                        ),
                        DropdownMenuEntry(
                          value: "paid",
                          label: "Paid",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Input(
                      label: "Transaction ID",
                    ),
                    ImageField(
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Button(
                      hasFullWidth: true,
                      text: "Update Payment Status",
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          },
          user: UserModel(
            pgId: "pgId",
            floorId: "floorId",
            roomId: "roomId",
            name: "Archama",
            email: "archana@gmail.com",
            mobile: "1122334455",
            pgName: "Girls PG",
            floorName: "01",
            roomName: "05",
            address: "Mumbai",
            age: "23",
            designation: "Student",
            aadharNumber: "112233445566",
            aadhar: null,
            dateOfJoining: DateTime.now().subtract(const Duration(days: 5)),
            dateOfLeaving: DateTime.now(),
          ),
        );
      },
    );
  }
}
