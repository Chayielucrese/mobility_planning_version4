import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RequestForm/request_form_ctrl.dart';

import '../../../Controller/app_ctrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RideTrackingController extends AppController {
  RequestFormController clientPositionsController =
      Get.put(RequestFormController());

  double? geocodePickupPointLng ;
  double? geocodePickupPointLat ;
  double? geocodeDestinationLng ;
  double? geocodeDestinationLat ;

  Future<void> getLatLngFromAddress() async {
    final String apiKey = 'YOUR_API_KEY';

    Future<Map<String, dynamic>> geocodeAddress(String address) async {
      final String url =
          'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'OK') {
          var location = jsonResponse['results'][0]['geometry']['location'];
          double lat = location['lat'];
          double lng = location['lng'];
          return {'lat': lat, 'lng': lng};
        } else {
          print('Error in geocoding: ${jsonResponse['status']}');
          return {};
        }
      } else {
        print('Failed to get response from Google Geocoding API');
        return {};
      }
    }

    Map<String, dynamic> pickupPointCoords =
        await geocodeAddress(clientPositionsController.pickUpPoint);
    print(
        'Pickup Point Coordinates: ${pickupPointCoords['lat']}, ${pickupPointCoords['lng']}');
    geocodePickupPointLat = pickupPointCoords['lat'];
    geocodePickupPointLng = pickupPointCoords['lng'];

    Map<String, dynamic> destinationCoords =
        await geocodeAddress(clientPositionsController.pickUpPoint);
    print(
        'Destination Coordinates: ${destinationCoords['lat']}, ${destinationCoords['lng']}');
    geocodePickupPointLat = destinationCoords['lat'];
    geocodePickupPointLng = destinationCoords['lat'];
  }
}
