import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pg/core/theme/app_colors.dart';

class ImageField extends StatelessWidget {
  final File? localImage;
  final VoidCallback onTap;
  final String label;
  final String? imageUrl;

  const ImageField({
    super.key,
    this.localImage,
    required this.onTap,
    this.label = "Upload Image",
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.dark,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.black.withValues(alpha: 0.1),
            ),
            child: localImage != null
                ? Image.file(localImage!, fit: BoxFit.cover)
                : imageUrl != null
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.image,
                        size: 80,
                        color: AppColors.gray,
                      ),
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
