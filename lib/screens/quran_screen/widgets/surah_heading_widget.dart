import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurani_app/models/surah_model.dart';
import 'package:qurani_app/shared/constants/asset_const.dart';

class SurahHeadingWidget extends StatelessWidget {
  const SurahHeadingWidget({
    super.key,
    required this.surah,
    required this.fontSize,
  });
  final SurahModel surah;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        fit: StackFit.loose,

        alignment: Alignment.center,
        children: [
          ClipRRect(
            child: FractionallySizedBox(
              widthFactor: 1.15,

              child: Image.asset(
                AssetConst.surah_head_decoration_image_path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              surah.name.arabic,
              style: GoogleFonts.amiriQuranTextTheme().headlineLarge?.copyWith(
                fontSize: fontSize - 2,
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.095,
            child: Text(
              textAlign: TextAlign.center,
              surah.type.label,
              style: GoogleFonts.reemKufiFunTextTheme(Typography.blackCupertino)
                  .labelLarge
                  ?.copyWith(
                    fontSize: fontSize / 2,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
