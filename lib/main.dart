import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/banner_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
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
      initialBinding: BindingsBuilder(
        () {
          Get.put(BannerController());
          Get.put(PgController());
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteName.userLayout,
      getPages: Routes.pages,
    );
  }
}
