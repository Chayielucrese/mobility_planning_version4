import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RequestForm/request_form_ctrl.dart';
import 'package:url_launcher/url_launcher.dart';

class RealTimeTracking extends StatefulWidget {
  RealTimeTracking({super.key});
  RequestFormController clientPositionsController = Get.put(RequestFormController());
  @override
  State<StatefulWidget> createState() => _RealTimeTrackingState();
}

class _RealTimeTrackingState extends State<RealTimeTracking> {
  static const _yaoundePosition = CameraPosition(
    target: LatLng(3.8480, 11.5021), // Coordinates for Yaoundé
    zoom: 14.0,
  );

  GoogleMapController? _googleMapController;
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};

  static const LatLng _origin = LatLng(3.8480, 11.5021);  // Initial position
  static const LatLng _destination = LatLng(3.8199, 11.5002);  // Destination position

  @override
  void initState() {
    super.initState();
    _setMarkers();
    _addPolyline();
  }

  void _setMarkers() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("initialPosition"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: _origin,
      ));

      _markers.add(Marker(
        markerId: MarkerId("destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: _destination,
      ));
    });
  }

  void _addPolyline() {
    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId("route"),
        visible: true,
        points: [_origin, _destination],
        color: Colors.pink,
        width: 2,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Google Map
          Container(
            height: 300,
            child: GoogleMap(
              initialCameraPosition: _yaoundePosition,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              markers: _markers,
              polylines: _polylines,
              onMapCreated: (controller) {
                _googleMapController = controller;
              },
            ),
          ),
          // Ride status
          Container(
            color: Colors.pink,
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "Your ride is on its way",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          // Driver details
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5nQjMS1TyzatKDxns_0VrOOQg0u_pq1_AJQ&s'), // Placeholder image
            ),
            title: Text('Yash bhansali'),
            subtitle: Text('Honda Activa\nRJ 19 AB 2121'),
            trailing: IconButton(
              icon: Icon(Icons.phone, color: Colors.green,),
             
          onPressed: () async {
            const uri = 'tel:+237656789088'; // Replace with actual number
            if (await canLaunch(uri)) {
              await launch(uri);
            } else {
              throw 'Could not launch $uri';
            }
          },
       
            ),
          ),
          // Pick up location
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Pick up location',
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // Meet driver button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Action to meet driver
              },
              child: Text(' Please meet driver at the pick up location', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RealTimeTracking(),
  ));
}