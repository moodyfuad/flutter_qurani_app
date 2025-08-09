import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurani_app/shared/constants/asset_const.dart';

class VersesSeparator extends StatelessWidget {
  const VersesSeparator(this.verseNumber, {super.key});
  final int verseNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetConst.verses_sperator_image_right,
            width: 15,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: true,
              ),

              verseNumber.toString(),
              style: Get.textTheme.displaySmall,
              textAlign: TextAlign.start,
            ),
          ),
          Image.asset(
            AssetConst.verses_sperator_image_left,
            width: 15,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
