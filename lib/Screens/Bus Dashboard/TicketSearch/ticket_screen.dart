import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';

class BusTicketSearchPage extends StatelessWidget {
  const BusTicketSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Text("Get a bus ticket"),
          // Background Image
       Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/img.png'),
                fit: BoxFit.cover, // Adjust to cover the screen
              ),
            ),
          ),
          // Transparent overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.8), // Darker transparent overlay
          ),
          // Content
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Get a bus ticket',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE91E63), // Dark pink text color
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'From',
                            labelStyle: TextStyle(color: Color(0xFFE91E63)), // Pink label text
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE91E63)), // Pink border on focus
                            ),
                          ),
                          items: <String>['Select', 'Location 1', 'Location 2']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                      Icon(Icons.swap_horiz, color: Color(0xFFE91E63)), // Pink icon color
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'To',
                            labelStyle: TextStyle(color: Color(0xFFE91E63)), // Pink label text
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE91E63)), // Pink border on focus
                            ),
                          ),
                          items: <String>['Select', 'Location 1', 'Location 2']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Departure',
                      labelStyle: TextStyle(color: Color(0xFFE91E63)), // Pink label text
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE91E63)), // Pink border on focus
                      ),
                      hintText: '15-09-2024',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Return (Optional)',
                      labelStyle: TextStyle(color: Color(0xFFE91E63)), // Pink label text
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE91E63)), // Pink border on focus
                      ),
                      hintText: 'DD-MM-YYYY',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(height: 20), 
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.departurelist);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE91E63), // Dark pink button
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                    ),
                    child: Text(
                      'Search Bus',
                      style: TextStyle(color: Colors.white),
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
