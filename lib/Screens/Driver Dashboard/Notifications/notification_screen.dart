import 'package:flutter/material.dart';
import 'package:mobility_planning_version4/Components/BottomNavigator.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Notifications/notification_ctrl.dart';

class BookingNotificationsPage extends StatelessWidget {
  const BookingNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Notifications",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text("Read Notifications",
                      style: TextStyle(color: Colors.white, fontSize: 13))),
              Tab(
                  child: Text("Unread Notifications",
                      style: TextStyle(color: Colors.white, fontSize: 13))),
            ],
          ),
        ),
        bottomNavigationBar:
            buildBottomNavigation(AppRoutes.drivernotification),
        body: TabBarView(
          children: [
            _buildReadMessagesTab(),
            _buildUnreadMessagesTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildReadMessagesTab() {
    final readMessages = [
      "Booking BOK-48 has been confirmed.",
      "Your appointment at Gold Coast has been scheduled.",
      "Booking BOK-46 has been completed.",
      "Booking BOK-48 has been confirmed.",
      "Your appointment at Gold Coast has been scheduled.",
      "Booking BOK-46 has been completed.",
    ];

    return ListView.builder(
      itemCount: readMessages.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  readMessages[index],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(
    BuildContext context,
  ) {
    // Map<String, dynamic> vehicle, NotifiicationController controller
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Notification Deletion',
            style: TextStyle(
              color: Colors.pink, fontSize: 20
            ),
          ),
          content: Text('Are you sure you want to delete this Notification?'),
          actions: [
            Row(
              children: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 5,),
                TextButton(
                  child: Text('Delete all'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                   SizedBox(width: 5,),
                TextButton(
                  child: Text(
                    'delete ',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    // controller.deleteVehicle(vehicle['id']);
                    Navigator.of(context).pop();
                  },
                ),
                   SizedBox(width: 5,),
              ],
            )
          ],
        );
      },
    );
  }
}

Widget _buildUnreadMessagesTab() {
  final unreadMessages = [
    "You have a new booking request BOK-48.",
    "Booking BOK-49 has been assigned to you.",
    "New message from Blue Theory.",
  ];

  return ListView.builder(
    itemCount: unreadMessages.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            unreadMessages[index],
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    },
  );
}
