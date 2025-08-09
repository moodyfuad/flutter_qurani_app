import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurani_app/models/surah_model.dart';
import 'package:qurani_app/shared/constants/asset_const.dart';

class SurahAlfatihaWidget extends StatelessWidget {
  const SurahAlfatihaWidget(this.surah, {super.key});
  final SurahModel surah;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FractionallySizedBox(
          alignment: Alignment.center,
          heightFactor: 1.1,

          child: Image.asset(
            AssetConst.alfatiha_frame,
            fit: BoxFit.cover,
            width: Get.width,
          ),
        ),
        Align(
          alignment: Alignment.center,

          child: CircleAvatar(
            radius: Get.height * 0.2,
            backgroundColor: Colors.transparent,

            child: Padding(
              padding: EdgeInsets.all(23),
              child: RichText(
                overflow: TextOverflow.fade,

                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: Get.height / 30 - 5,

                    color: Colors.black,
                    fontFamily: 'QCF_P001',
                    height: 1.5,
                  ),

                  children: surah.verses.map((verse) {
                    if (verse.verseNumber == 1) {
                      return TextSpan(text: '${verse.qcf}\n');
                    }

                    return TextSpan(text: ' ${verse.qcf}');
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: Get.height * 0.125,
          left: 0,
          right: 0,
          child: Align(
            child: Text(
              surah.name.arabic,
              style: GoogleFonts.amiriQuran(fontSize: Get.height * 0.028),
            ),
          ),
        ),
        Positioned(
          bottom: Get.height * 0.14,
          left: 0,
          right: 0,
          child: Align(
            child: Text(
              1.toString(),
              style: GoogleFonts.amiriQuran(fontSize: Get.height * 0.03),
            ),
          ),
        ),
      ],
    );
  }
}
