import 'dart:async';


import 'package:get/get.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';

class DriverWelcomeController extends AppController {
  @override
  void onInit() {
    super.onInit();

    // Navigate after a delay of 4 seconds
    Timer(const Duration(seconds: 4), () {
      Get.toNamed(AppRoutes.driverStats);
    });
    update();
  }
}
