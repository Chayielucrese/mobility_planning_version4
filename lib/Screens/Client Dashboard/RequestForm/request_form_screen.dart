

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RequestForm/request_form_ctrl.dart';
import 'package:mobility_planning_version4/Service/google_palaces_api_service.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestFormController>(
      builder: (controller) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Taxis Reservation',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.pink,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Instant Booking'),
                Tab(text: 'Advance Booking'),
              ],
              indicatorColor:
                  Colors.white, // Changes the indicator color to white
              labelColor: Colors.white, // Selected label color
              unselectedLabelColor: Colors.white, // Unselected label color
            ),
          ),
          body: TabBarView(
            children: [
              // Add your Instant Booking screen widget here
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 230,
                        padding: EdgeInsets.all(100.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'Assets/taxis_reserve.png'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

// image: DecorationImage(
//                           image: AssetImage(
//                               vehicle['vehicleType'] == 'car'
//                                   ? 'Assets/Front car-pana.png'
//                                   : 'Assets/Motocross-amico.png'),
//                           fit: BoxFit.cover,
//                         ),
                      // Lower div with form elements
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Form(
                              child: Column(
                                children: [
                                  //pickup point
                                  GooglePlaceAutoCompleteTextField(
                                    textEditingController:
                                        controller.pickupPointController,
                                    googleAPIKey: GooglPlacesApi.apiUrl,
                                    inputDecoration: const InputDecoration(
                                      labelText: 'Pickup Point',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink),
                                      ),
                                      prefixIcon:
                                          Icon(Icons.flag, color: Colors.pink),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 12.0),
                                    ),

                                    debounceTime: 300, // default 600 ms,
                                    countries: [
                                      'cm'
                                    ], // optional by default null is set
                                    isLatLngRequired:
                                        true, // if you required coordinates from place detail
                                    getPlaceDetailWithLatLng:
                                        (Prediction prediction) {
                                      // this method will return latlng with place detail
                                      print("placeDetails" +
                                          prediction.lng.toString());
                                    }, // this callback is called when isLatLngRequired is true
                                    itemClick: (Prediction prediction) {
                                      controller.pickupPointController.text =
                                          prediction.description!;
                                      controller
                                              .pickupPointController.selection =
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset: prediction
                                                      .description!.length));
                                    },
                                    // if we want to make custom list item builder
                                    itemBuilder: (context, index,
                                        Prediction prediction) {
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Expanded(
                                                child: Text(
                                                    "${prediction.description ?? ""}"))
                                          ],
                                        ),
                                      );
                                    },
                                    // if you want to add seperator between list items
                                    seperatedBuilder: Divider(),
                                    // want to show close icon
                                    isCrossBtnShown: true,
                                    // optional container padding
                                    containerHorizontalPadding: 10,
                                    // place type
                                    placeType: PlaceType.geocode,
                                  ),
//Destination

                                  SizedBox(height: 20),
                                  GooglePlaceAutoCompleteTextField(
                                    textEditingController:
                                        controller.destinationController,
                                    googleAPIKey: GooglPlacesApi.apiUrl,
                                    inputDecoration: const InputDecoration(
                                      labelText: 'Destination',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink),
                                      ),
                                      prefixIcon:
                                          Icon(Icons.flag, color: Colors.pink),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 12.0),
                                    ),

                                    debounceTime: 300, // default 600 ms,
                                    countries: [
                                      'cm'
                                    ], // optional by default null is set
                                    isLatLngRequired:
                                        true, // if you required coordinates from place detail
                                    getPlaceDetailWithLatLng:
                                        (Prediction prediction) {
                                      // this method will return latlng with place detail
                                      print("placeDetails" +
                                          prediction.lng.toString());
                                    }, // this callback is called when isLatLngRequired is true
                                    itemClick: (Prediction prediction) {
                                      controller.destinationController.text =
                                          prediction.description!;
                                      controller
                                              .destinationController.selection =
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset: prediction
                                                      .description!.length));
                                    },
                                    // if we want to make custom list item builder
                                    itemBuilder: (context, index,
                                        Prediction prediction) {
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Expanded(
                                                child: Text(
                                                    "${prediction.description ?? ""}"))
                                          ],
                                        ),
                                      );
                                    },
                                    // if you want to add seperator between list items
                                    seperatedBuilder: Divider(),
                                    // want to show close icon
                                    isCrossBtnShown: true,
                                    // optional container padding
                                    containerHorizontalPadding: 10,
                                    // place type
                                    placeType: PlaceType.geocode,
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    controller:
                                        controller.numberOfSeatsController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10.0),
                                      labelText:
                                          'Number of seats by default is one(1)',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink),
                                      ),
                                      prefixIcon: Icon(Icons.chair_alt_outlined,
                                          color: Colors.pink),
                                    ),
                                  ),
                                  //submit button
                                  SizedBox(height: 15),
                                  ElevatedButton(
                                    onPressed: () async {
                                      controller.reservationType = "instant";
                                      controller.getTokenAndCreateRequest();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 60.0, vertical: 5.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Submit Request',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Add your Advance Booking screen widget here
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 230,
                        padding: EdgeInsets.all(100.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'Assets/taxis_reserve.png'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Lower div with form elements
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Form(
                              child: Column(
                                children: [
                                  GooglePlaceAutoCompleteTextField(
                                    textEditingController:
                                        controller.advancePickupPointController,
                                    googleAPIKey: GooglPlacesApi
                                        .apiUrl, // Replace with your API key
                                    inputDecoration: InputDecoration(
                                      labelText: 'Pickup Point',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink),
                                      ),
                                      prefixIcon:
                                          Icon(Icons.flag, color: Colors.pink),
                                    ),
                                    debounceTime:
                                        300, // Adjust debounce time as necessary
                                    countries: [
                                      "cm"
                                    ], // Limit search to Cameroon
                                    isLatLngRequired: true,
                                    getPlaceDetailWithLatLng: (prediction) {
                                      controller.advancePickupPointController
                                          .text = prediction.description!;
                                      print(
                                          "Pickup Location: ${prediction.description}, lat: ${prediction.lat}, lng: ${prediction.lng}");
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  GooglePlaceAutoCompleteTextField(
                                    textEditingController:
                                        controller.advanceDestinationConroller,
                                    googleAPIKey: GooglPlacesApi
                                        .apiUrl, // Replace with your API key
                                    inputDecoration: InputDecoration(
                                      labelText: 'Destination',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink),
                                      ),
                                      prefixIcon:
                                          Icon(Icons.flag, color: Colors.pink),
                                    ),
                                    debounceTime:
                                        300, // Adjust debounce time as necessary
                                    countries: [
                                      "cm"
                                    ], // Limit search to Cameroon
                                    isLatLngRequired: true,
                                    getPlaceDetailWithLatLng: (prediction) {
                                      controller.advanceDestinationConroller
                                          .text = prediction.description!;
                                      print(
                                          "Destination: ${prediction.description}, lat: ${prediction.lat}, lng: ${prediction.lng}");
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  TextField(
                                    controller: controller.dateController,
                                    decoration: InputDecoration(
                                      labelText: 'Date',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink),
                                      ),
                                      prefixIcon: Icon(Icons.date_range,
                                          color: Colors.pink),
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2100),
                                              barrierColor: Colors.transparent);
                                      if (pickedDate != null) {
                                        controller.dateController.text =
                                            pickedDate.toString().split(' ')[0];
                                      }
                                    },
                                    readOnly: true,
                                  ),
                                  SizedBox(height: 20),
                                  TextField(
                                    controller: controller.timeController,
                                    decoration: InputDecoration(
                                      labelText: 'Time',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink),
                                      ),
                                      prefixIcon: Icon(Icons.access_time,
                                          color: Colors.pink),
                                    ),
                                    onTap: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );
                                      if (pickedTime != null) {
                                        controller.timeController.text =
                                            pickedTime.format(context);
                                      }
                                    },
                                    readOnly: true,
                                  ),
                                  SizedBox(height: 15),
                                  ElevatedButton(
                                    onPressed: () async {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 60.0, vertical: 16.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Submit Request',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
