import 'package:flutter/material.dart';
import 'package:islami/ui/utilities/assets.dart';
import 'package:islami/ui/utilities/styles.dart';
import 'package:islami/model/sura_model.dart';

class SuraRow extends StatelessWidget {
  // final SuraRow sura;

  final SuraDM sura;

  const SuraRow({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIndexImage(),
        const SizedBox(
          width: 24,
        ),
        Expanded(child: buildEnInfo()),
        buildNameAr(),
      ],
    );
  }

  Widget buildIndexImage() => Container(
        width: 52,
        height: 52,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.suraNumberBg),
          ),
        ),
        child: Center(
          child: Text(
            sura.index.toString(),
            style: AppTextStyles.whiteBold14,
          ),
        ),
      );

  Widget buildEnInfo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sura.nameEn,
            style: AppTextStyles.whiteBold20,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "${sura.verses} Verses",
            textAlign: TextAlign.start,
            style: AppTextStyles.whiteBold14,
          ),
        ],
      );

  buildNameAr() => Text(
        sura.nameAr,
        style: AppTextStyles.whiteBold16,
      );
}
