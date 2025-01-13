import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/core/utils/image_utils.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/image_field.dart';
import 'package:pg/widgets/input.dart';

class AdminEditUserScreen extends StatefulWidget {
  const AdminEditUserScreen({super.key});

  @override
  State<AdminEditUserScreen> createState() => _AdminEditUserScreenState();
}

class _AdminEditUserScreenState extends State<AdminEditUserScreen> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Edit User"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Input(
              label: "Name",
            ),
            Input(
              label: "Email",
            ),
            Input(
              label: "Phone Number",
            ),
            Input(
              label: "Address",
            ),
            Input(
              label: "Age",
            ),
            Input(
              label: "Address",
            ),
            Input(
              label: "Designation",
            ),
            Input(
              label: "Aadhar Number",
            ),
            ImageField(
              label: "Aadhar Image",
              onTap: () async {
                final image = await ImageUtils.pickImage(
                    imageSource: ImageSource.gallery);
                setState(() {
                  selectedImage = image;
                });
              },
              localImage: selectedImage,
            ),
            Input(
              onTap: () {},
              readOnly: true,
              label: "Date of Joining",
            ),
            Input(
              onTap: () {},
              readOnly: true,
              label: "Date of Leaving",
            ),
            SizedBox(
              height: 16.0,
            ),
            Button(
              hasFullWidth: true,
              text: "Update User",
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
