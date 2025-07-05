import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islami/ui/screens/sura_details/sura_detials.dart';
import 'package:islami/ui/utilities/assets.dart';
import 'package:islami/ui/utilities/colors.dart';
import 'package:islami/ui/utilities/constants.dart';
import 'package:islami/ui/utilities/styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiLogo),
          buildSearchTextField(),
          Expanded(child: buildSuraListView()),
        ],
      ),
    );
  }

  buildSearchTextField() {
    var defaultBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.gold, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      decoration: InputDecoration(
        border: defaultBorder,
        focusedBorder: defaultBorder,
        enabledBorder: defaultBorder,
        labelText: "Sura Name",
        labelStyle: AppTextStyles.whiteBold16,
        prefixIcon: const ImageIcon(
          AssetImage(AppAssets.icQuran),
          color: AppColors.gold,
          size: 28,
        ),
      ),
      style: AppTextStyles.whiteBold16,
      cursorColor: AppColors.gold,
    );
  }

  Widget buildSuraListView() {
    return ListView.separated(
      itemCount: AppConstants.suras.length,
      itemBuilder: (context, index) {
        print("Suras count: ${AppConstants.suras.length}");
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, SuraDetials.routeName,
                  arguments: AppConstants.suras[index]);
            },
            child: SuraRow(sura: AppConstants.suras[index]));
      },
      separatorBuilder: (_, __) => const Divider(
        indent: 64,
        endIndent: 64,
      ),
    );
  }
}
