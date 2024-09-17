import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';

class DepartureListPage extends StatelessWidget {
  const DepartureListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Upper section with background image and text
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4, // Adjust height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/img.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.6), // Dark overlay with transparency
              alignment: Alignment.center,
              child: const Center(
                child: Text(
                  'MUSANGO DepartureList Information',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Departure information list
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total 14 Bus(es) found',
                    style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2, // Replace with the actual number of departure items
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('YAOUNDE - BUEA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      Text('Musango Bus Service Co. Ltd.', style: TextStyle(fontSize: 14)),
                                      Text('YDE - BUA M 001', style: TextStyle(color: Colors.grey)),
                                      Row(
                                        children: [
                                          Text('08:05 AM', style: TextStyle(color: Colors.red)),
                                          SizedBox(width: 10),
                                          Text('DEPOT GUINNES'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('09:05 AM', style: TextStyle(color: Colors.red)),
                                          SizedBox(width: 10),
                                          Text('NDOBBO BONABERI'),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text('1hr 0m', style: TextStyle(fontWeight: FontWeight.bold)),
                                      SizedBox(height: 5),
                                      Text('31 Seats Available', style: TextStyle(color: Colors.grey)),
                                      Text('MOTANGA DEPARTURE', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('FCFA 10,000.00', style: TextStyle(fontSize: 16, color:Colors.pink, fontWeight: FontWeight.bold)),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle View Seat action
                                        Get.toNamed(AppRoutes.seatview);
                                      },
                                      child: Text('View Seat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.pink, // Button color
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}