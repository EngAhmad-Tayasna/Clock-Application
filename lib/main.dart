import 'package:clock_app/services/service.dart';
import 'package:clock_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main()  async {
  await  GetStorage.init() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.light,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(),
    );
  }
}
