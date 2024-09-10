import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Welcome/welcome_ctrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestFormController extends AppController {
  TokenController token = Get.put(TokenController());
  ClientWelcomeController welcomeController =
      Get.put(ClientWelcomeController());
  final pickupPointController = TextEditingController();
  final destinationController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final advancePickupPointController = TextEditingController();
  final advanceDestinationConroller = TextEditingController();
  final numberOfSeatsController = TextEditingController();
  String? reservationType = '';
  String? result = '';
  String pickUpPoint = "";
  String destination = "";
  var pickupPointText = ''.obs;
  var rideName;
  get isInstantBooking => null; // RxString

  @override
  void onInit() {
    super.onInit();
    rideName = retrieveRideName();
  }

  Future<http.Response> createReservation(
      String? newToken,
      String pickup_point,
      String destination,
      String date,
      int numberOfSeats,
      String time,
      String reservationType,
      int rideType_id,
      int reservation_id) async {
    return await http.post(
      Uri.parse("${Config.apiUrl}/reserveVehicle/$reservation_id/$rideType_id"),
      headers: {
        'Authorization': 'Bearer $newToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'pickup_point': pickup_point,
        'destination': destination,
        'time': time,
        'date': date,
        'reservation_type': reservationType,
        'number_of_seats': numberOfSeats
      }),
    );
  }

  void getTokenAndCreateRequest() async {
    String? tokens = await token.retriveToken();
    if (tokens != null) {
      SubmitForm(tokens);
    } else {
      print("No token found");
      // Handle the case where the token is null
    }
  }

  void SubmitForm(String Mytoken) async {
    String pickup_point = pickupPointController.text;
    String destination = destinationController.text;
    String advance_pickup_point = advancePickupPointController.text;
    String advance_destination = advanceDestinationConroller.text;
    String date = dateController.text;
    String time = timeController.text;
    String numberOfSeats = numberOfSeatsController.text;
    int? reservationId = await welcomeController.retriveReservationId();

    int? rideType = await welcomeController.retrieveRideId();

    print("$pickup_point: my reservation id $rideType: $reservationId: ");

    try {
      if (pickup_point.isNotEmpty && destination.isNotEmpty) {
        final response = await createReservation(
            Mytoken,
            pickup_point,
            destination,
            date,
            int.parse(numberOfSeats),
            time,
            reservationType = "instant",
            reservationId!,
            rideType!);
        print("helllllllo");
        print("$pickup_point: IT WORKED $rideType: $reservationId: ");

        if (response.statusCode == 201) {
          final responseJson = json.decode(response.body);
          pickUpPoint = pickupPointController.text;
          destination = destinationController.text;

          print("$pickup_point: IT WORKED $rideType: $reservationId: ");

          alertSuccess(responseJson['msg']);
          Get.toNamed(AppRoutes.waitingconfirmation);
        } else if (response.statusCode == 404) {
          final errorJson = json.decode(response.body);

          alertError(errorJson['msg']);
        } else {
          print("An error occurred: ${response.body}");
          final errorResponse = json.decode(response.body);
          alertError('${errorResponse['msg']}');
        }
      } else if (advance_pickup_point.isNotEmpty &&
          advance_destination.isNotEmpty) {
        final response = await createReservation(
            Mytoken,
            advance_pickup_point,
            advance_destination,
            date,
            int.parse(numberOfSeats),
            time,
            reservationType = "advance",
            reservationId!,
            rideType!);

        if (response.statusCode == 201) {
          final responseJson = json.decode(response.body);
          alertSuccess("${responseJson['msg']}");
        } else {
          print("An error occurred: ${response.body}");
          final errorResponse = json.decode(response.body);
          alertError('${errorResponse['msg']}');
        }
      } else {
        alertError("Fill in all required fields");
      }
    } catch (e) {
      print("Internal server error: ${e.toString()}");
      alertError("An internal error occurred. Please try again. ${e}");
    }
  }

  void setBookingType(bool bool) {}

  Future<String?> retrieveRideName() async {
    return await getRideType();
  }

  Future<String?> getRideType() async {
    final pref = await SharedPreferences.getInstance();

    return await pref.getString("rideType");
  }
}
