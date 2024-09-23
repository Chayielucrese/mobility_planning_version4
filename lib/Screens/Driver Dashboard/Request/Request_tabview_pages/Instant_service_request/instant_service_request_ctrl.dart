import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';

class InstantServiceRequestController extends AppController {
  TokenController tokens = Get.put(TokenController());

  var requestPlan = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    requestDetails();
    userProfile();
  }

  Future<http.Response> getReservationAccordingToSubscription() async {
    String? tok = await tokens.retriveToken();
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
      print("Fetching requests...");
      final res = await getReservationAccordingToSubscription();
      if (res.statusCode == 200) {
        final response = json.decode(res.body) as Map<String, dynamic>;

        if (response.containsKey('msg') &&
            response['msg'] != null &&
            response['msg'].isNotEmpty) {
          final List<dynamic> requestList = response['msg'];

          requestPlan.value = requestList.map((subscription) {
            return {
              'id': subscription['id'],
              'pickUpPoint': subscription['pickUpPoint'],
              'destination': subscription['destination'],
              'numberOfSeats': subscription['numberOfSeats'],
              'date': subscription['date'],
            
            };
          }).toList();
          update();
        } else {
          print("No requests found or the list is empty.");
          requestPlan.value = [];
        }

        print("${requestPlan[0]['name']}: request data");
      } else {
        print('Failed to load subscription plans');
      }
    } catch (e) {
      print("Error occurred while fetching subscriptionDetails: $e");
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
    String? newToken = await tokens.retriveToken();
    return await http.get(
      Uri.parse("${Config.apiUrl}/getUserProfile"),
      headers: {
        'Authorization': 'Bearer $newToken',
        'Content-Type': 'application/json',
      },
    );
  }
}
