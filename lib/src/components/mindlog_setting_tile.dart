import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MindLogSettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;
  final VoidCallback? onTap;
  final bool showTopDivider;

  const MindLogSettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
    this.onTap,
    this.showTopDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showTopDivider) const Divider(color: Color(0xFFF8FAFC), height: 1, thickness: 1),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 32, height: 32,
                  decoration: const BoxDecoration(color: Color(0xFFF8FAFC), shape: BoxShape.circle),
                  child: Icon(icon, color: const Color(0xFF64748B), size: 16),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title, 
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF334155))
                  ),
                ),
                trailing,
              ],
            ),
          ),
        ),
      ],
    );
  }
}