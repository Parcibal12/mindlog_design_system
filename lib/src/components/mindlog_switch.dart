import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MindLogSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const MindLogSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: value ? AppColors.primaryGreen : const Color(0xFFE2E8F0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              left: value ? 24 : 0,
              right: value ? 0 : 24,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: value ? AppColors.primaryGreen : const Color(0xFFCBD5E1),
                    width: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}