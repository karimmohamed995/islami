import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami/ui/screens/home/tabs/azkar/azkar_tab.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/utilities/assets.dart';
import 'package:islami/ui/utilities/colors.dart';
import 'package:islami/ui/utilities/styles.dart';

class Home extends StatefulWidget {
  static const routeName = "home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  // el 7al tany a3ml list of widgets
  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const AzkarTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  /// da 8al 3shan atn2l ben el screens

  // buildBody() {
  //   if (selectedIndex == 0) return const QuranTab();
  //   if (selectedIndex == 1) return const AhadethTab();
  //   if (selectedIndex == 2) return const SebhaTab();
  //   if (selectedIndex == 3) return const RadioTab();
  //   if (selectedIndex == 4) return const AzkarTab();
  // }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        iconSize: 30,
        selectedLabelStyle: AppTextStyles.whiteBold12,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: buildBottomNAvigationBarIcom(
                  AppAssets.icQuran, selectedIndex == 0),
              label: "Quran"),
          BottomNavigationBarItem(
              icon: buildBottomNAvigationBarIcom(
                  AppAssets.icAhadeth, selectedIndex == 1),
              label: "Ahadeth"),
          BottomNavigationBarItem(
              icon: buildBottomNAvigationBarIcom(
                  AppAssets.icSebha, selectedIndex == 2),
              label: "Sebha"),
          BottomNavigationBarItem(
              icon: buildBottomNAvigationBarIcom(
                  AppAssets.icRadio, selectedIndex == 3),
              label: "Radio"),
          BottomNavigationBarItem(
              icon: buildBottomNAvigationBarIcom(
                  AppAssets.icAzkar, selectedIndex == 4),
              label: "Azkar"),
        ]);
  }

  buildBottomNAvigationBarIcom(String icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blackWithOpacity60 : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ImageIcon(
        AssetImage(icon),
      ),
    );
  }
}
