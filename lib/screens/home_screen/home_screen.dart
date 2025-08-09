import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:qurani_app/screens/home_screen/widgets/home_screen_item.dart';
import 'package:qurani_app/screens/my_saving_screen/my_saving_screen.dart';
import 'package:qurani_app/screens/quran_screen/quran_screen.dart';
import 'package:qurani_app/shared/constants/asset_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('عنوان', style: GoogleFonts.reemKufi()),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.6),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.orange.withValues(alpha: 0.5),
              BlendMode.color,
            ),
            image: AssetImage(
              AssetConst.homeBgImagePath,
              bundle: DefaultAssetBundle.of(context),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(15),

          children: [
            HomeScreenItem(
              height: Get.height * 0.15,
              text: 'القران الكريم',
              imagePath: AssetConst.quranBookImagePath,
              onTap: () => Get.to(
                () => QuranScreen(),
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 200),
                transition: Transition.leftToRight,
              ),
            ),
            SizedBox(height: 20),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              shrinkWrap: true,
              children: [
                HomeScreenItem(
                  text: 'تســبيح',
                  imagePath: AssetConst.subhaImagePath,
                ),
                HomeScreenItem(
                  text: 'حفظي',
                  imagePath: AssetConst.myQuranSavingsImagePath,
                  onTap: () => Get.to(() => MySavingScreen()),
                ),
                HomeScreenItem(
                  text: 'دعــاء',
                  imagePath: AssetConst.duaaImagePath,
                ),
                HomeScreenItem(
                  text: 'آية لي',
                  imagePath: AssetConst.kidWithQuranImagePath,
                ),
              ],
            ),
            SizedBox(height: 20),
            HomeScreenItem(
              height: Get.height * 0.15,
              text: 'الرقية الشرعية',
              imagePath: AssetConst.alrugyaImagePath,
            ),
            Column(
              children: [
                Text("display L", style: Get.textTheme.displayLarge),
                Text("display m", style: Get.textTheme.displayMedium),
                Text("display s", style: Get.textTheme.displaySmall),
                Text("headline L", style: Get.textTheme.headlineLarge),
                Text("headline M", style: Get.textTheme.headlineMedium),
                Text("headline s", style: Get.textTheme.headlineSmall),
                Text("title L", style: Get.textTheme.titleLarge),
                Text("title m", style: Get.textTheme.titleMedium),
                Text("title s", style: Get.textTheme.titleSmall),
                Text("body l", style: Get.textTheme.bodyLarge),
                Text("body m", style: Get.textTheme.bodyMedium),
                Text("body s", style: Get.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
