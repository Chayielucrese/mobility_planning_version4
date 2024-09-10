import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RequestForm/request_form_ctrl.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Ride_tracking/tracking_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RealTimeTracking extends StatelessWidget {
  const RealTimeTracking({super.key});

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(3.8480, 11.5021), // Default position (you can change this)
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    RideTrackingController clientPositionsInLatLng =
        Get.put(RideTrackingController());
    RequestFormController clientPositionsController =
        Get.put(RequestFormController());

    Marker? pickupPoint;
    Marker? destination;

    if (clientPositionsController.pickUpPoint != null) {
      pickupPoint = Marker(
        markerId: const MarkerId("pickupPoint"),
        position: LatLng(clientPositionsInLatLng.geocodePickupPointLat!,
            clientPositionsInLatLng.geocodePickupPointLng!),
        infoWindow: const InfoWindow(title: "Pickup Point"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      );
    }

    if (clientPositionsController.destination != null) {
      destination = Marker(
        markerId: const MarkerId("destination"),
        position: LatLng(clientPositionsInLatLng.geocodeDestinationLat!,
            clientPositionsInLatLng.geocodeDestinationLng!),
        infoWindow: const InfoWindow(title: "Destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
    }

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        markers: {
          if (pickupPoint != null) pickupPoint,
          if (destination != null) destination,
        },
        onMapCreated: (GoogleMapController googleMapController) {
          // Store the map controller if needed
        },
      ),
    );
  }
}
