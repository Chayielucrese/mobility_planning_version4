
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mobility_planning_version4/Controller/real_time_tracking.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Ride_tracking/tracking_ctrl.dart';

class RideTrackingPage extends StatelessWidget {
  RideTrackingController controller = Get.put(RideTrackingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    RealTimeTracking(),
                   
                   
                  ],
                ),

    )]));
    }}