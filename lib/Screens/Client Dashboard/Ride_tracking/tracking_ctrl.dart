import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RequestForm/request_form_ctrl.dart';

class RideTrackingController extends AppController {
  RequestFormController clientPositionsController = Get.put(RequestFormController());

  // @override
  // void onInit() {
  //   super.onInit();
  //   print("${clientPositionsController.pickUpPoint}, hello there, ${clientPositionsController.destination}");
  //   if (clientPositionsController.pickUpPoint != null && clientPositionsController.destination != null) {
  //     getLatLngFromAddress();  // Trigger geocoding on init
  //   } else {
  //     print("Pickup point or destination is not set.");
  //   }
  // }

  // double? geocodePickupPointLng;
  // double? geocodePickupPointLat;
  // double? geocodeDestinationLng;
  // double? geocodeDestinationLat;

  // Future<void> getLatLngFromAddress() async {
  //   const String apiKey = 'YOUR_GOOGLE_API_KEY';  // Replace with your actual API key

  //   Future<Map<String, dynamic>> geocodeAddress(String address) async {
  //     final String url = 'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$apiKey';
      
  //     print("Request URL: $url"); // Debug the request URL
  //     final response = await http.get(Uri.parse(url));

  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       if (jsonResponse['status'] == 'OK') {
  //         var location = jsonResponse['results'][0]['geometry']['location'];
  //         double lat = location['lat'];
  //         double lng = location['lng'];
  //         return {'lat': lat, 'lng': lng};
  //       } else {
  //         print('Geocoding error: ${jsonResponse['status']}');
  //         return {};
  //       }
  //     } else {
  //       print('Failed to get response from Google Geocoding API, status code: ${response.statusCode}');
  //       return {};
  //     }
  //   }

  //   // Geocode pickup point
  //   if (clientPositionsController.pickUpPoint != null) {
  //     Map<String, dynamic> pickupPointCoords = await geocodeAddress(clientPositionsController.pickUpPoint);
  //     if (pickupPointCoords.isNotEmpty) {
  //       print('Pickup Point Coordinates: ${pickupPointCoords['lat']}, ${pickupPointCoords['lng']}');
  //       geocodePickupPointLat = pickupPointCoords['lat'];
  //       geocodePickupPointLng = pickupPointCoords['lng'];
  //     } else {
  //       print('Failed to geocode the pickup point');
  //     }
  //   } else {
  //     print('Pickup point is not available.');
  //   }

  //   // Geocode destination point
  //   if (clientPositionsController.destination != null) {
  //     Map<String, dynamic> destinationCoords = await geocodeAddress(clientPositionsController.destination);
  //     if (destinationCoords.isNotEmpty) {
  //       print('Destination Coordinates: ${destinationCoords['lat']}, ${destinationCoords['lng']}');
  //       geocodeDestinationLat = destinationCoords['lat'];
  //       geocodeDestinationLng = destinationCoords['lng'];
  //     } else {
  //       print('Failed to geocode the destination');
  //     }
  //   } else {
  //     print('Destination point is not available.');
  //   }
  // }
}
