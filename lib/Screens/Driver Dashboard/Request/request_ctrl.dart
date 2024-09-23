import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';

import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';

class DriverRequestController extends AppController{
   TokenController tokens = Get.put(TokenController());

  var requestPlan = <Map<String, dynamic>>[].obs;

  void onInit() {
    super.onInit();
    requestDetails();
    
  }

  String name = "";
  String description = "";
  String price = "";

  Future<http.Response> getReservationAccordingToSubscription() async {
    String? tok = await tokens.retriveToken();
    var http;
    return await http.get(
      Uri.parse('${Config.apiUrl}/getReservationAccordingToSubscription'),
      headers: {
        'Authorization': 'Bearer $tok',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<void> requestDetails() async {
    try {
      print("heiiiiii");
      final res = await getReservationAccordingToSubscription();
      if (res.statusCode == 200) {
        final response = json.decode(res.body) as Map<String, dynamic>;

        if (response.containsKey('msg') &&
            response['msg'] != null &&
            response['msg'].isNotEmpty) {
          final List<dynamic> requestList =
              response['msg'];

          requestPlan.value = requestList.map((subscription) {
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
          requestPlan.value = [];
        }

        print("${requestPlan[0]['name']}: your array");
      } else {
        print('Failed to load subscription plans');
      }
    } catch (e) {
      print("Error occurred while fetching subscriptionDetails: $e");
    }
  }

 






}