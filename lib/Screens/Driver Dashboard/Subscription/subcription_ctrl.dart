import 'dart:convert';
import 'dart:core';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverSubscriptionController extends AppController {
  TokenController tokens = Get.put(TokenController());

  var subscriptionPlans = <Map<String, dynamic>>[].obs;

  void onInit() {
    super.onInit();
    subscriptionDetails();
  }

  String name = "";
  String description = "";
  String price = "";

  Future<http.Response> fetchSubscriptionPlans() async {
    String? tok = await tokens.retriveToken();
    return await http.get(
      Uri.parse('${Config.apiUrl}/getAllReservationTtypes'),
      headers: {
        'Authorization': 'Bearer $tok',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<void> subscriptionDetails() async {
    try {
      print("heiiiiii");
      final res = await fetchSubscriptionPlans();
      if (res.statusCode == 200) {
        final response = json.decode(res.body) as Map<String, dynamic>;

        if (response.containsKey('reservationTypeList') &&
            response['reservationTypeList'] != null &&
            response['reservationTypeList'].isNotEmpty) {
          final List<dynamic> subScriptionList =
              response['reservationTypeList'];

          subscriptionPlans.value = subScriptionList.map((subscription) {
            return {
              'id': subscription['id'],
              'name': subscription['name'],
              'description': subscription['description'],
              'price': subscription['price'],
              'terms': subscription['terms'],
              'recommendation': subscription['subscription']
            };
          }).toList();
          update();
        } else {
          print("No requests found or the list is empty.");
          subscriptionPlans.value = [];
        }

        print("${subscriptionPlans[0]['name']}: your array");
      } else {
        print('Failed to load subscription plans');
      }
    } catch (e) {
      print("Error occurred while fetching subscriptionDetails: $e");
    }
  }

  Future<void> getSubcriptionId(int id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt("id", id);
  }
    Future<void> getSubcriptionName(String name) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("name", name);
  }
}
