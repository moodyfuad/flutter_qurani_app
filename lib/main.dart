import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qurani_app/screens/home_screen/home_screen.dart';
import 'package:qurani_app/shared/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, minTextAdapt: true, splitScreenMode: true);
    return SafeArea(
      bottom: true,
      top: false,
      child: GetMaterialApp(
        defaultTransition: Transition.cupertino,
        
        title: 'Flutter Demo',
        locale: Locale('ar', 'sa'),

        debugShowCheckedModeBanner: false,

        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
