import 'dart:convert';
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:intl/intl.dart'; // Import the intl package

class SubscriptionDetailController extends AppController {
  TokenController token = Get.put(TokenController());

  @override
  void onInit() {
    super.onInit();
    userSubscription();
    userProfile();
    update();
  }

  Future<http.Response> getSubscription() async {
    String? newToken = await token.retriveToken();
    return await http.get(
      Uri.parse("${Config.apiUrl}/viewSubsriptionDetails"),
      headers: {
        'Authorization': 'Bearer $newToken',
        'Content-Type': 'application/json',
      },
    );
  }

  String name = "";
  String description = "";
  int price = 0; // Storing price as an int
  String startDate = "";
  String endDate = "";

  Future<void> userSubscription() async {
    try {
      final res = await getSubscription();
      if (res.statusCode == 200) {
        final response = json.decode(res.body);

        print("${response['msg'].length}: user subscription  ");

        name = response['msg']['name'];
        description = response['msg']['description'];

        // Safely handle the 'price' field: Check if it's a String, then convert it to int
        dynamic priceValue = response['msg']['price'];
        if (priceValue is String) {
          price = int.tryParse(priceValue) ??
              0; // Convert to int, default to 0 if parse fails
        } else if (priceValue is int) {
          price = priceValue;
        }

        startDate = response['user_subscription']['startDate'];
        endDate = response['user_subscription']['endDate'];

        // Parse the dates
        DateTime startDateTime = DateTime.parse(startDate);
        DateTime endDateTime = DateTime.parse(endDate);

        // Format the dates using intl
        final DateFormat formatter = DateFormat('MM/dd/yyyy');
        startDate = formatter.format(startDateTime);
        endDate = formatter.format(endDateTime);

        // Check if the subscription is expired
        DateTime currentDateTime = DateTime.now();

        if (currentDateTime.isAfter(endDateTime)) {
          Get.toNamed(AppRoutes.driversubscription);
        } else {
          update();
        }
      } else if (res.statusCode == 404) {
        Get.toNamed(AppRoutes.driversubscription);
      } else {
        print("Failed to get subscription: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred while fetching subscription: $e");
    }
  }

  String username = "";
  String email = "";
  String city = "";
  String phone = "";
  String profilePicture = "";
  String surname = '';

  Future<void> userProfile() async {
    try {
      final res = await getProfile();
      if (res.statusCode == 200) {
        final response = json.decode(res.body);
        print("${response['msg']}: user profile");

        username = response['msg']['name'];
        surname = response['msg']['surname'];
        email = response['msg']['email'];
        city = response['msg']['city'];
        phone = response['msg']['phone'];
        profilePicture = response['msg']['profileImage'];
        update();
      } else {
        print("Failed to get profile: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred while fetching profile: $e");
    }
  }

  Future<http.Response> getProfile() async {
    String? newToken = await token.retriveToken();
    return await http.get(
      Uri.parse("${Config.apiUrl}/getUserProfile"),
      headers: {
        'Authorization': 'Bearer $newToken',
        'Content-Type': 'application/json',
      },
    );
  }
}
