import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/utilities/assets.dart';
import 'package:islami/ui/utilities/colors.dart';
import 'package:islami/ui/utilities/styles.dart';

class SuraDetials extends StatefulWidget {
  static const routeName = "SuraDetials";
  const SuraDetials({super.key});

  @override
  State<SuraDetials> createState() => _SuraDetialsState();
}

class _SuraDetialsState extends State<SuraDetials> {
  late SuraDM sura;
  late String suraContent;

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDM;
    if (suraContent.isEmpty) {
      readSuraContent();
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.gold,
          ),
        ),
        title: Text(
          sura.nameEn,
          style: AppTextStyles.goldBold20,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(AppAssets.leftPattern),
                Expanded(
                  child: Text(
                    sura.nameAr,
                    style: AppTextStyles.goldBold20,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppAssets.rightPattern),
              ],
            ),
          ),
          suraContent.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.gold,
                ))
              : Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        suraContent,
                        style: AppTextStyles.goldBold20,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
          Image.asset(AppAssets.mosqueBg)
        ],
      ),
    );
  }

  void readSuraContent() async {
    String fileName = "${sura.index}.txt";
    Future<String> contentFuture = rootBundle.loadString(fileName);
    suraContent = await contentFuture;
    List<String> suraLines = suraContent.trim().split("/n");
    for (var i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}] ";
    }
    suraContent = suraLines.join();
    setState(() {});
  }
}
