import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool hasFullWidth;
  final String text;
  final VoidCallback onTap;

  const Button({
    super.key,
    this.hasFullWidth = false,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: hasFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
