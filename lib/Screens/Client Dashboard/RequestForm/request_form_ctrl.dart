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
  ClientWelcomeController welcomeController = Get.put(ClientWelcomeController());

  final pickupPointController = TextEditingController();
  final destinationController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final advancePickupPointController = TextEditingController();
  final advanceDestinationController = TextEditingController(); // Fixed typo here
  final numberOfSeatsController = TextEditingController();

  String? reservationType = '';
  String pickUpPoint = "";
  String destination = "";

  @override
  void onInit() {
    super.onInit();
    retrieveRideName(); // Removed unused variable
  }

  Future<http.Response> createReservation(
    String newToken,
    String pickupPoint,
    String destination,
    String date,
    int numberOfSeats,
    String time,
    String reservationType,
    int rideTypeId,
    int reservationId
  ) async {
    return await http.post(
      Uri.parse("${Config.apiUrl}/reserveVehicle/$reservationId/$rideTypeId"),
      headers: {
        'Authorization': 'Bearer $newToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'pickup_point': pickupPoint.trim(),
        'destination': destination.trim(),
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
      submitForm(tokens);
    } else {
      print("No token found");
    }
  }

  void submitForm(String token) async {
    String pickupPoint = pickupPointController.text.trim();
    String destination = destinationController.text.trim();
    String advancePickupPoint = advancePickupPointController.text.trim();
    String advanceDestination = advanceDestinationController.text.trim();
    String date = dateController.text;
    String time = timeController.text;
    String numberOfSeats = numberOfSeatsController.text;

    int? reservationId = await welcomeController.retriveReservationId();
    int? rideTypeId = await welcomeController.retrieveRideId();

    // Debugging prints to check values
    print("Pickup Point: $pickupPoint, Destination: $destination");
    print("Advance Pickup Point: $advancePickupPoint, Advance Destination: $advanceDestination");
    print("RideTypeId: $rideTypeId, ReservationId: $reservationId");

    try {
      if (rideTypeId == null || reservationId == null) {
        alertError("Ride type or reservation ID is missing.");
        return;
      }

      if (pickupPoint.isNotEmpty && destination.isNotEmpty) {
        reservationType = "instant";
        print("Instant booking triggered");

        final response = await createReservation(
          token,
          pickupPoint,
          destination,
          date,
          int.parse(numberOfSeats),
          time,
          reservationType!,
          rideTypeId,
          reservationId
        );

        if (response.statusCode == 201) {
          final responseJson = json.decode(response.body);
          print("Instant reservation created successfully");
          alertSuccess(responseJson['msg']);
              //  Get.toNamed(AppRoutes.trackride);
    Get.toNamed(AppRoutes.waitingconfirmation);
          pickupPointController.clear();
          destinationController.clear();
          numberOfSeatsController.clear();
        } else {
          handleErrorResponse(response);
        }
      } else if (advancePickupPoint.isNotEmpty && advanceDestination.isNotEmpty) {
        reservationType = "advance";
        print("Advance booking triggered");

        final response = await createReservation(
          token,
          advancePickupPoint,
          advanceDestination,
          date,
          int.parse(numberOfSeats),
          time,
          reservationType!,
          rideTypeId,
          reservationId
        );

        if (response.statusCode == 201) {
          final responseJson = json.decode(response.body);
          print("Advance reservation created successfully");
          alertSuccess(responseJson['msg']);
          advanceDestinationController.clear();
          advancePickupPointController.clear();
          dateController.clear();
          timeController.clear();
                      Get.toNamed(AppRoutes.waitingconfirmation);
        } else {
          handleErrorResponse(response);
        }
      } else {
        alertError("Fill in all required fields");
      }
    } catch (e) {
      print("Internal server error: ${e.toString()}");
      alertError("An internal error occurred. Please try again.");
    }
  }

  void handleErrorResponse(http.Response response) {
    print("An error occurred: ${response.body}");
    try {
      final errorResponse = json.decode(response.body);
      if (response.statusCode == 404) {
        alertError(errorResponse['msg']);
      } else {
        alertError('${errorResponse['msg']}');
      }
    } catch (e) {
      print("Internal server error: ${e.toString()}");
      alertError("An internal error occurred. Please try again.");
    }
  }

  Future<String?> retrieveRideName() async {
    return await getRideType();
  }

  Future<String?> getRideType() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("rideType");
  }


  @override
  void onClose() {

    advanceDestinationController.dispose();
    advanceDestinationController.dispose();
    dateController.dispose();
    timeController.dispose();
    pickupPointController.dispose();
    destinationController.dispose();
    numberOfSeatsController.dispose();
 
    super.onClose();
  }

}
