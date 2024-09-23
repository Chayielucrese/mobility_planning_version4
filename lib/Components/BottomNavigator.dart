import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Statistics/statistics_ctrl.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subcription_ctrl.dart';

// Replace this with the actual source for isDocumentVerified
bool isDocumentVerified = false;

List<String> pages = [
  AppRoutes.driverStats,
  AppRoutes.viewvehicle,
  AppRoutes.driverrequest,
  AppRoutes.subscriptiondetails,
  AppRoutes.drivernotification
];

Widget buildBottomNavigation(String goto) {
  DriverDashboardController controller = Get.put(DriverDashboardController());
  DriverSubscriptionController subscriptionController = Get.put(DriverSubscriptionController());
  int index = pages.indexOf(goto);
  return BottomNavigationBar(
    currentIndex: index < 0 ? 0 : index,
    onTap: (i) {
      // Check if the user is trying to access the Request page and is not verified
      if (i == 2 && !controller.isDocumentVerified) {
        Get.snackbar('Access Denied',
            'Your documents are not verified. You cannot access the Re quest page.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: const Color.fromARGB(255, 247, 160, 186));
      } 
      
      else {
        // Only navigate if the condition is not met
        Get.toNamed(pages[i]);
      }
    },
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    iconSize: 30,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedItemColor: const Color(0xFFF5365C),
    unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: "Dashboard",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.directions_car),
        label: "Vehicle",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.request_page),
        label: "Request",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.subscriptions),
        label: "Subscription",
      ),
          BottomNavigationBarItem(
        icon: Icon(Icons.notification_add),
        label: "Notification",
      ),
    ],
  );
}
