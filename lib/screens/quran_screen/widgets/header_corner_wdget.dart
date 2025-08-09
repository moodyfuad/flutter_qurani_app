import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurani_app/shared/constants/asset_const.dart';

class HeaderCornerWidget extends StatelessWidget {
  const HeaderCornerWidget({
    super.key,
    required this.text,
    required this.width,
  });
  final double width;
  final String text;
  double get _fontSize => 16;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: _fontSize + 15,
            width: width,
            child: Image.asset(AssetConst.corner_frame_image, fit: BoxFit.fill),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.reemKufiFunTextTheme(Typography.blackCupertino)
                .labelLarge
                ?.copyWith(fontSize: _fontSize, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
