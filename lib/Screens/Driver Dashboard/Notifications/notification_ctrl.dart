import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';

class NotifiicationController extends AppController{
 TokenController tokens = Get.put(TokenController());

  var notificationPlan = <Map<String, dynamic>>[].obs;

  void onInit() {
    super.onInit();
    allDriverNotifications();
    
  }

  String name = "";
  String description = "";
  String price = "";

  Future<http.Response> fetchNotications() async {
    String? tok = await tokens.retriveToken();
    return await http.get(
      Uri.parse('${Config.apiUrl}/retrieveNotification'),
      headers: {
        'Authorization': 'Bearer $tok',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<void> allDriverNotifications() async {
    try {
      print("heiiiiii");
      final res = await fetchNotications();
      if (res.statusCode == 200) {
        final response = json.decode(res.body) as Map<String, dynamic>;

        if (response.containsKey('Notifications') &&
            response['Notifications'] != null &&
            response['Notifications'].isNotEmpty) {
          final List<dynamic> notificationList =
              response['Notifications'];

          notificationPlan.value = notificationList.map((notification) {
            return {
              'id': notification['id'],
              'subject': notification['subject'],
              'content': notification['content'],
              // 'date': notification['date'],
            
            };
          }).toList();
          update();
        } else {
          print("No requests found or the list is empty.");
          notificationPlan.value = [];
        }

        print("${notificationPlan[0]['subject']}: your array");
      } else {
        print('Failed to load notificationList plans');
      }
    } catch (e) {
      print("Error occurred while fetching notificationList: $e");
    }
  }


  
}