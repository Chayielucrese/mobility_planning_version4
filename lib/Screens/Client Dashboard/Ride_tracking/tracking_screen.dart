
import 'package:flutter/material.dart';
import 'package:mobility_planning_version4/Controller/map_api.dart';

class RideTrackingPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                   const MapScreen(),
                   
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.pink,
                            child: Icon(Icons.menu, color: Colors.white),
                          ),
                        );
                      }),
                    ),
                  ],
                ),

    )]));
    }}