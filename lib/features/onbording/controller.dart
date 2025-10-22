import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController {
  final currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  // 🔹 Aller à la page suivante
  void nextPage(List pages) {
    print(currentIndex.value);
    if (currentIndex.value < pages.length - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
    }
  }

  // 🔹 Revenir à la page précédente
  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
