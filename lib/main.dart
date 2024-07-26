import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_mockup_generator/Utils/Helpers/theme_controller.dart';
import 'package:mobile_mockup_generator/Utils/Theme/theme.dart';
import 'package:mobile_mockup_generator/features/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.light,
        title: 'Flutter Demo',
        theme: TAppTheme.lightTheme,
        home: Home());
  }
}
