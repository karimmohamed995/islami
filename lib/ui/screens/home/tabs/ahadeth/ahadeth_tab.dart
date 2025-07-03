import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/utilities/assets.dart';

class Hadeth {
  String title;
  String content;
  Hadeth(this.title, this.content);
}

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Hadeth> ahadeth = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.ahadethBackground),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiLogo),
        ],
      ),
    );
  }

  void readAhadethFile() async {
    String ahadethFile =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethList =
        ahadethFile.split("#\r\n"); // contains 50 hadeth as string
    for (int i = 0; i < ahadethList.length; i++) {
      String hadeth = ahadethList[i];
      List<String> hadethLines = hadeth.split("/n");
      String title = hadethLines.removeAt(0);
      ahadeth.add(Hadeth(title, hadethLines.join()));
    }
    print(ahadethFile);
  }
}
