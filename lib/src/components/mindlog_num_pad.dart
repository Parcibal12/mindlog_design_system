import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MindLogNumPad extends StatelessWidget {
  final Function(String) onDigitTap;
  final VoidCallback onBackspaceTap;
  final VoidCallback onBiometricTap;
  final bool showBiometrics;

  const MindLogNumPad({
    super.key,
    required this.onDigitTap,
    required this.onBackspaceTap,
    required this.onBiometricTap,
    this.showBiometrics = true,
  });

  Widget _buildKey(Widget child, VoidCallback onTap, bool isDark) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.01), offset: const Offset(0, 2), blurRadius: 4)],
        ),
        child: Material(
          color: isDark ? AppColors.darkSurface : AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isDark ? AppColors.darkIndicatorInactive : AppColors.surfaceKeyboard),
              ),
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<String> digits, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: digits.map((d) => _buildKey(
        Text(d, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: isDark ? AppColors.darkTextHeader : AppColors.textNumber)),
        () => onDigitTap(d),
        isDark
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.surfaceKeyboard,
        border: Border(top: BorderSide(color: isDark ? AppColors.darkIndicatorInactive : AppColors.borderLight, width: 0.8)),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow(['1', '2', '3'], isDark),
          const SizedBox(height: 8),
          _buildRow(['4', '5', '6'], isDark),
          const SizedBox(height: 8),
          _buildRow(['7', '8', '9'], isDark),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildKey(
                showBiometrics ? Icon(Icons.fingerprint, color: isDark ? AppColors.secondaryGreen : AppColors.primaryDark, size: 32) : const SizedBox.shrink(),
                showBiometrics ? onBiometricTap : () {},
                isDark
              ),
              _buildKey(
                Text('0', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: isDark ? AppColors.darkTextHeader : AppColors.textNumber)),
                () => onDigitTap('0'),
                isDark
              ),
              _buildKey(
                Icon(Icons.backspace_outlined, color: isDark ? AppColors.darkTextSubtitle : AppColors.textSubtitle, size: 24),
                onBackspaceTap,
                isDark
              ),
            ],
          ),
        ],
      ),
    );
  }
}