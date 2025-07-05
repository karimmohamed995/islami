import 'package:flutter/material.dart';
import 'package:islami/ui/utilities/colors.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = 'OnboardingScreen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<String> onboardingImages = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
    'assets/images/onboarding4.png',
    'assets/images/onboarding5.png',
  ];

  void goNext() {
    if (currentIndex < onboardingImages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, 'home');
    }
  }

  void goBack() {
    if (currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ===== Background images =====
          Positioned.fill(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingImages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  onboardingImages[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          // ===== Foreground Buttons and Dots =====
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back
                TextButton(
                  onPressed: goBack,
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color:
                          currentIndex == 0 ? AppColors.gold : AppColors.gold,
                      fontSize: 16,
                    ),
                  ),
                ),

                // Dots (Indicators)
                Row(
                  children: List.generate(
                    onboardingImages.length,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentIndex == i ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.gold
                            .withOpacity(currentIndex == i ? 1 : 0.4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                // Next / Finish
                TextButton(
                  onPressed: goNext,
                  child: Text(
                    currentIndex == onboardingImages.length - 1
                        ? "Finish"
                        : "Next",
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
