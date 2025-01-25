import 'package:flutter/material.dart';
import 'package:pg/models/user_model.dart';
import 'package:pg/widgets/admin_payment_due_card.dart';

class AdminPendingDuesScreen extends StatelessWidget {
  const AdminPendingDuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return AdminPaymentDueCard(
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
