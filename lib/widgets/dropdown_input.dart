import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pg/core/theme/app_colors.dart';

class DropdownInput extends StatelessWidget {
  final String label;
  final List items;
  final String hintText;
  final Function(dynamic id)? onSelected;

  const DropdownInput({
    super.key,
    required this.label,
    required this.items,
    this.hintText = "Click to Select",
    this.onSelected,
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
        DropdownMenu(
          width: Get.width,
          hintText: hintText,
          onSelected: onSelected,
          enableSearch: true,
          dropdownMenuEntries: items
              .map(
                (pg) => DropdownMenuEntry(
                  value: pg.id,
                  label: pg.name,
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: 16.0,
        )
      ],
    );
  }
}
