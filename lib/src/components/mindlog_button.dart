import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MindLogButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFullWidth;
  final Color backgroundColor;

  const MindLogButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = false,
    this.backgroundColor = AppColors.primaryGreen,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
        child: Text(
          text, 
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5)
        ),
      ),
    );
  }
}