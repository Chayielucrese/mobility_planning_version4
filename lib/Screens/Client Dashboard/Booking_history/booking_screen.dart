import 'package:flutter/material.dart';

class ClientBookingHistory extends StatelessWidget {
  final List<Map<String, dynamic>> bookingHistory = [
    {
      'date': '2024-09-01',
      'time': '12:00 PM',
      'pickupLocation': 'Downtown',
      'dropOffLocation': 'Airport',
      'status': 'Completed'
    },
    {
      'date': '2024-09-02',
      'time': '03:30 PM',
      'pickupLocation': 'Main Street',
      'dropOffLocation': 'Mall',
      'status': 'Cancelled'
    },
    {
      'date': '2024-09-03',
      'time': '09:00 AM',
      'pickupLocation': 'Park Avenue',
      'dropOffLocation': 'Office',
      'status': 'Pending'
    },
  ];

  ClientBookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Booking History', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(color: Colors.white),
          bottom: TabBar(
            labelColor: Colors.white, // Color for the selected tab text
            unselectedLabelColor: Colors.grey[400], // Color for unselected tabs
            indicatorColor: Colors.white, // Color for the tab indicator
            tabs: [
              Tab(
                  child:
                      Text('Pending', style: TextStyle(color: Colors.white))),
              Tab(
                  child:
                      Text('Cancelled', style: TextStyle(color: Colors.white))),
              Tab(
                  child:
                      Text('Completed', style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookingList('Pending'),
            _buildBookingList('Cancelled'),
            _buildBookingList('Completed'),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList(String status) {
    final filteredBookings =
        bookingHistory.where((booking) => booking['status'] == status).toList();

    return filteredBookings.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/no_booking.png', // Add an image to show when list is empty
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'No $status bookings for now',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: filteredBookings.length,
            itemBuilder: (context, index) {
              final booking = filteredBookings[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date: ${booking['date']}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Time: ${booking['time']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Pickup: ${booking['pickupLocation']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Drop-off: ${booking['dropOffLocation']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Status: ${booking['status']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: booking['status'] == 'Completed'
                              ? Colors.green
                              : booking['status'] == 'Cancelled'
                                  ? Colors.red
                                  : Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
