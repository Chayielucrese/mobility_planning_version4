import 'package:flutter/material.dart';
import 'package:mobility_planning_version4/Routes/app_pages.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        // initialBinding: BoissonBinding(),
        // home: PushNotificationPage(),
        initialRoute: AppRoutes.welcome,
        getPages: AppPages.pages);
  }
}
