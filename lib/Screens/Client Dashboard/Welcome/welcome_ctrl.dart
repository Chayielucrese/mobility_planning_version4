import 'dart:convert';


import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientWelcomeController extends AppController {
  var rides = <Map<String, dynamic>>[].obs;

  TokenController token = Get.put(TokenController());

  @override
  void onInit() {
    super.onInit();
    token.loadToken().then((_) => getRides());
  }

  Future<void> createReservation() async {
    try {
      final res = await reservation();
      if (res.statusCode == 201 || res.statusCode == 200) {
        final responseJson = json.decode(res.body);

        await storeReservationId(responseJson['msg']['id']);
        print("true");

        update();
      } else {
        print("Failed to get createReservation: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred while creating reservation rides: $e");
    }
  }

  Future<void> storeReservationId(int reservationId) async {
    final pref = await SharedPreferences.getInstance();
    Future<bool> result = pref.setInt("id", reservationId);
    print('$result: my reservation id');
  }

  Future<int?> retriveReservationId() async {
    return await getReservationId();
  }

  Future<int?> getReservationId() async {
    final pref = await SharedPreferences.getInstance();
    int? reserveId = await pref.getInt("id");
    print('$reserveId my reservation id');
    return reserveId;
  }

  Future<http.Response> reservation() async {
    final tok = await token.retriveToken();
    return await http.post(
      Uri.parse("${Config.apiUrl}/createReservation"),
      headers: {
        'Authorization': 'Bearer $tok',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<void> getRides() async {
    try {
      final res = await ride();
      if (res.statusCode == 200) {
        final response = json.decode(res.body);
        final ridesList = response['msg'] as List<dynamic>;

        // Convert each ride to a map and add it to the rides list
        rides.value = ridesList.map((ride) {
          return {
            'id': ride['id'],
            'name': ride['name'],
            'description': ride['description'],
          };
        }).toList();

        update();
      } else {
        print("Failed to get rides: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred while fetching rides: $e");
    }
  }

  Future<void> removeTokenFromLocalStorage() async {
    final pref = await SharedPreferences.getInstance();
    bool results = await pref.remove("token");
    print("token removed: $results");
  }

  Future<http.Response> ride() async {
    final tok = await token.retriveToken();
    return await http.get(
      Uri.parse("${Config.apiUrl}/getRides"),
      headers: {
        'Authorization': 'Bearer $tok',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<int?> retrieveRideId() async {
    return await getRideId();
  }

  Future<int?> getRideId() async {
    final pref = await SharedPreferences.getInstance();
    int? ride_id = await pref.getInt("rideId");
    return ride_id;
  }

  Future<void> storeRideId(int rideId) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt("rideId", rideId);
  }

  Future<void> storeRideType(String rideType) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("rideType", rideType);
  }
}
