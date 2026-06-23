import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MindLogTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? prefixIcon;
  final int? maxLines;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const MindLogTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.maxLines = 1,
    this.autofocus = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? AppColors.darkIndicatorInactive : AppColors.borderLight),
        boxShadow: const [BoxShadow(color: Color(0x0C000000), offset: Offset(0, 1), blurRadius: 1)],
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        maxLines: maxLines,
        autofocus: autofocus,
        style: TextStyle(fontSize: 14, color: isDark ? AppColors.darkTextHeader : const Color(0xFF475569)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: isDark ? AppColors.darkTextSubtitle : AppColors.textSubtitle, fontSize: 14),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: isDark ? AppColors.darkTextSubtitle : AppColors.textSubtitle, size: 20) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}