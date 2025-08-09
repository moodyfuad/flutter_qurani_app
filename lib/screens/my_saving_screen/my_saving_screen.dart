import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class MySavingScreen extends StatefulWidget {
  const MySavingScreen({super.key});

  @override
  State<MySavingScreen> createState() => _MySavingScreenState();
}

class _MySavingScreenState extends State<MySavingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Placeholder(fallbackHeight: 40),
              // Placeholder(fallbackHeight: 40),
            ],
          ),
          GridView.builder(
            padding: EdgeInsets.all(30),
            scrollDirection: Axis.vertical,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 8.0,
                ),
                child: Stack(
                  children: [
                    Expanded(child: Placeholder()),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'الاسم',
                        style: GoogleFonts.reemKufi().copyWith(
                          fontSize: Get.textTheme.headlineMedium!.fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
