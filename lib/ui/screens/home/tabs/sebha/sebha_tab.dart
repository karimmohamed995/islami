import 'package:flutter/material.dart';
import 'package:islami/ui/utilities/assets.dart';
import 'package:islami/ui/utilities/styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: incrementCounter,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.sebhaBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.islamiLogo),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                  style: AppTextStyles.whiteBold36,
                ),
              ),
            ),
            // === صورة السبحة بحجم نسبي للشاشة ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AspectRatio(
                aspectRatio: 379 / 460,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.sebhaImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 80),
                        const Text("سبحان الله",
                            style: AppTextStyles.whiteBold36),
                        const SizedBox(height: 12),
                        Text(
                          "$counter",
                          style: AppTextStyles.whiteBold36,
                        ),
                      ],
                    ),
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
