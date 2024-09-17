import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Booking_history/booking_ctrl.dart';
class ClientBookingHistory extends StatelessWidget {
  final ClientBookingHistoryController controller = Get.put(ClientBookingHistoryController());

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
              Tab(child: Text('Pending', style: TextStyle(color: Colors.white))),
              Tab(child: Text('Cancelled', style: TextStyle(color: Colors.white))),
              Tab(child: Text('Completed', style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookingList('pending'),
            _buildBookingList('cancelled'),
            _buildBookingList('complete'),
          ],
        ),
      ),
    );
  }

 Widget _buildBookingList(String status) {
  ClientBookingHistoryController controller = Get.put(ClientBookingHistoryController());

  return Obx(() {
    if (controller.bookingPlan.isEmpty) {
      return Column(
mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Make sure you are connected"),
          SizedBox(height: 20,),
      Center(
        child: CircularProgressIndicator(color: Colors.pink,),  // Show loading while fetching data
      )]);
    }

    final filteredBookings = controller.bookingPlan
        .where((booking) => booking['bookingStatus'] == status)
        .toList();

    return filteredBookings.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/city_driver.png', 
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
                        'Time: ${booking['numberOfSeats']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      // Add more booking info...
                    ],
                  ),
                ),
              );
            },
          );
  });
}

}
