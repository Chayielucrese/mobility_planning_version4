import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';

class ClientBookingHistoryController extends AppController {
  TokenController tokens = Get.put(TokenController());

  var bookingPlan = <Map<String, dynamic>>[].obs;
@override
void onInit() {
  super.onInit();
  allUSerRequest();  // Fetch data when the controller is initialized
}


  String name = "";
  String description = "";
  String price = "";

  Future<http.Response> fetchNotications() async {
    String? tok = await tokens.retriveToken();
    return await http.get(
      Uri.parse('${Config.apiUrl}/viewReservationDetails'),
      headers: {
        'Authorization': 'Bearer $tok',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<void> allUSerRequest() async {
    try {
      print("heiiiiii");
      final res = await fetchNotications();
      if (res.statusCode == 200) {
        final response = json.decode(res.body) as Map<String, dynamic>;

        if (response.containsKey('Request') &&
            response['Request'] != null &&
            response['Request'].isNotEmpty) {
          final List<dynamic> bookingList = response['Request'];

          bookingPlan.value = bookingList.map((request) {
            return {
              'pickUpPoint': request['pickUpPoint'],
              'destination': request['destination'],
              'numberOfSeats': request['numberOfSeats'],
              'reservedVehicleFee': request['reservedVehicleFee'],
              'bookingStatus': request['bookingStatus'],
              'paymentMode': request['paymentMode'],
              'date': request['date']
              // 'date': notification['date'],
            };
          }).toList();
          update();
        } else {
          print("No requests found or the list is empty.");
          bookingPlan.value = [];
        }

        print("${bookingPlan[0]['subject']}: your array");
      } else {
        print('Failed to load Request plans');
      }
    } catch (e) {
      print("Error occurred while fetching Request: $e");
    }
  }
}
