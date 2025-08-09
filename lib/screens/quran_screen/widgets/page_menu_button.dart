import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class PageMenuButton extends StatefulWidget {
  const PageMenuButton({super.key});

  @override
  _PageMenuButtonState createState() => _PageMenuButtonState();
}

class _PageMenuButtonState extends State<PageMenuButton>
    with SingleTickerProviderStateMixin {
  late OverlayEntry? menuOverLayEntry;
  late final AnimationController _animationController;
  bool menuVisible = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    menuOverLayEntry = OverlayEntry(builder: buildMenuOverlay);
    super.initState();
  }

  @override
  void dispose() {
    super.didChangeDependencies();
    menuOverLayEntry?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: toggleMenuOverlay, icon: Icon(Icons.menu));
  }

  toggleMenuOverlay() async {
    if (menuVisible && menuOverLayEntry != null) {
      await _animationController.reverse();
      menuOverLayEntry?.remove();
      menuOverLayEntry = null;
    } else {
      Overlay.of(
        context,
      ).insert(menuOverLayEntry ??= OverlayEntry(builder: buildMenuOverlay));
      _animationController.forward();
      // menuVisible = !menuVisible;
    }
    menuVisible = !menuVisible;
  }

  Widget buildMenuOverlay(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(onTap: toggleMenuOverlay),
        Positioned(
          top: 40,
          left: 10,
          child: Animate(
            controller: _animationController,
            effects: [
              FadeEffect(),
              if (menuVisible) SlideEffect(begin: Offset(-1, 0)),
            ],

            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
                tileMode: TileMode.mirror,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  // color: Colors.orange.withValues(alpha: 0),
                ),
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.4,
                  maxHeight: Get.height * 0.3,
                ),
                child: Column(
                  children:
                      [
                        buildMenuItem(
                          'اضافة لقائمتي',
                          Icons.add_box_outlined,
                          onPress: () {},
                        ),
                        buildMenuItem(
                          'ضع علامة',
                          Icons.bookmark_border_outlined,
                          onPress: () {},
                        ),
                      ].animate(
                        interval: 150.milliseconds,

                        effects: [SlideEffect(begin: Offset(-1, 0))],
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMenuItem(String text, IconData icon, {VoidCallback? onPress}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: MaterialButton(
        onPressed: onPress,
        color: Colors.white,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                text,
                style: GoogleFonts.reemKufi().copyWith(
                  fontSize: Get.textTheme.bodyLarge!.fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
