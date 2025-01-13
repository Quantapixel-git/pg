import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/routes/routes.dart';
import 'package:pg/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteName.home,
      getPages: Routes.pages,
    );
  }
}
