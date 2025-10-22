import 'package:flutter/material.dart';
import 'package:trading_journey/core/utils/colors.dart';

class DrawerItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;
  final String? badge;
  final bool isNetworkImage;

  const DrawerItem({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.imagePath,
    this.isSelected = false,
    this.color,
    this.badge,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    // Couleur principale à utiliser
    final Color iconColor = color ?? (isSelected ? Color(0xFFFF6B35) : AppColors.greyColor);

    // Déterminer quel type d'icône afficher
    Widget leadingWidget;
    if (imagePath != null) {
      leadingWidget = isNetworkImage
          ? Image.network(
        imagePath!,
        width: 24,
        height: 24,
        color: iconColor,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.image_not_supported, color: iconColor),
      )
          : Image.asset(
        imagePath!,
        width: 24,
        height: 24,
        color: iconColor,
      );
    } else {
      leadingWidget = Icon(icon ?? Icons.circle, color: iconColor);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2D2420) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: onTap,
        leading: leadingWidget,
        title: Text(
          label,
          style: TextStyle(
            color: iconColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontFamily: "poppins"
          ),
        ),
        trailing: badge != null
            ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            badge!,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
            : null,
      ),
    );
  }
}
