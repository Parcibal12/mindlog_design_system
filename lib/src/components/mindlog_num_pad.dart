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

  Widget _buildKey(Widget child, VoidCallback onTap) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.01), offset: const Offset(0, 2), blurRadius: 4)],
        ),
        child: Material(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.surfaceKeyboard),
              ),
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<String> digits) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: digits.map((d) => _buildKey(
        Text(d, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.textNumber)),
        () => onDigitTap(d),
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
      decoration: const BoxDecoration(
        color: AppColors.surfaceKeyboard,
        border: Border(top: BorderSide(color: AppColors.borderLight, width: 0.8)),
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow(['1', '2', '3']),
          const SizedBox(height: 8),
          _buildRow(['4', '5', '6']),
          const SizedBox(height: 8),
          _buildRow(['7', '8', '9']),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildKey(
                showBiometrics ? const Icon(Icons.fingerprint, color: AppColors.primaryDark, size: 32) : const SizedBox.shrink(),
                showBiometrics ? onBiometricTap : () {},
              ),
              _buildKey(
                const Text('0', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.textNumber)),
                () => onDigitTap('0'),
              ),
              _buildKey(
                const Icon(Icons.backspace_outlined, color: AppColors.textSubtitle, size: 24),
                onBackspaceTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}