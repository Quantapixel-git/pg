import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final bool readOnly;
  final bool enabled;
  final VoidCallback? onTap;
  final bool showLabel;
  final TextInputType keyboardType;
  final bool isSecureEntry;

  const Input({
    super.key,
    this.controller,
    required this.label,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.showLabel = true,
    this.keyboardType = TextInputType.text,
    this.isSecureEntry = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel)
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.dark,
              fontWeight: FontWeight.w500,
            ),
          ),
        if (showLabel)
          SizedBox(
            height: 4.0,
          ),
        TextField(
          obscureText: isSecureEntry,
          onTap: onTap,
          keyboardType: keyboardType,
          enabled: enabled,
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: enabled
                ? Colors.transparent
                : AppColors.black.withValues(alpha: 0.050),
            hintText: label,
          ),
        ),
        if (showLabel)
          SizedBox(
            height: 16.0,
          )
      ],
    );
  }
}
