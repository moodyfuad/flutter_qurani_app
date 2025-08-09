import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenItem extends StatefulWidget {
  final String text;
  final String imagePath;
  final double? height;
  final void Function()? onTap;

  const HomeScreenItem({
    super.key,
    required this.text,
    required this.imagePath,
    this.height,
    this.onTap,
  });

  @override
  _HomeScreenItemState createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  final double _fontSize = Get.textTheme.displayMedium!.fontSize!;
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _scale = 1.2;
        });
      },
      onTapUp: (details) {
        setState(() {
          _scale = 1;
        });
      },
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        height: widget.height ?? double.infinity,
        foregroundDecoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: 0.05),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              widget.imagePath,
              bundle: DefaultAssetBundle.of(context),
            ),
            fit: BoxFit.cover,
            scale: 1.0,
            opacity: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.8),
              blurRadius: 10,
              spreadRadius: 2,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: AnimatedScale(
            duration: Duration(milliseconds: 200),
            scale: _scale,
            child: Text(
              widget.text,
              style: GoogleFonts.reemKufi().copyWith(
                fontSize: _fontSize,
                color: Colors.white,

                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                    blurRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-2, -2),
                    spreadRadius: 0,
                    blurRadius: 10,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),

              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
