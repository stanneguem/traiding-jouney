import 'package:flutter/material.dart';

import 'custom_drawer_items.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final Function(String) onItemSelected;
  final VoidCallback onLogout;
  final VoidCallback? onSupport;

  const CustomDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.onItemSelected,
    required this.onLogout,
    this.onSupport,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1C1C1E),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: "poppins"
                ),
              ),
              Text(
                userEmail,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                    fontFamily: "poppins"
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    DrawerItem(
                      label: "Accueil",
                      isSelected: true,
                      onTap: () => onItemSelected("home"),
                      imagePath: "assets/images/Icon.png",
                    ),
                    DrawerItem(
                      label: "Bilan",
                      onTap: () => onItemSelected("bilan"),
                      imagePath: "assets/images/Icon (1).png",
                    ),
                    DrawerItem(
                      label: "Historique",
                      imagePath: "assets/images/Icon (2).png",
                      onTap: () => onItemSelected("historique"),
                    ),
                    DrawerItem(
                      label: "Progression",
                      imagePath: "assets/images/pp.png",
                      onTap: () => onItemSelected("progression"),
                    ),
                    DrawerItem(
                      label: "Calendrier",
                      imagePath: "assets/images/Icon (3).png",
                      badge: "5+",
                      onTap: () => onItemSelected("calendrier"),
                    ),
                    DrawerItem(
                      label: "Objectif",
                      imagePath: "assets/images/Icon (4).png",
                      onTap: () => onItemSelected("objectif"),
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.grey, thickness: 0.9),
                    DrawerItem(
                      label: "Support",
                      imagePath: "assets/images/Icon (5).png",
                      onTap: () => onItemSelected("objectif"),
                    ),
                    const SizedBox(height: 10),
                    DrawerItem(
                      label: "Se déconnecter",
                      imagePath: "assets/images/Icon (6).png",
                      onTap: onLogout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

