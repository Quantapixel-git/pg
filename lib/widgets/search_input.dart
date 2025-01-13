import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';

class SearchInput extends StatelessWidget {
  final Function(String value) onSumbited;
  final String hintText;

  const SearchInput({
    super.key,
    required this.onSumbited,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onSubmitted: onSumbited,
      leading: Icon(Icons.search),
      backgroundColor: WidgetStatePropertyAll(AppColors.white),
      hintText: hintText,
      elevation: WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
