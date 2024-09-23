import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/SubscriptionDetails/detail_ctrl.dart';

class SubscriptionDetailPage extends StatelessWidget {
  const SubscriptionDetailPage({super.key});

  @override
 Widget build(BuildContext context) {
    return GetBuilder<SubscriptionDetailController>(
      builder: (controller) => Scaffold(
      appBar: AppBar(
        title: Text('My Subscription', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // User Information Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage('${controller.profilePicture}'), // Profile image
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        '${controller.username} ${controller.surname}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          '${controller.name}/30 days',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                         
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Subscription Details
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subscription Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.access_time, color: Colors.pink),
                      title: Text('Start Date'),
                      subtitle: Text('${controller.startDate}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.timelapse, color: Colors.pink),
                      title: Text('End Date'),
                      subtitle: Text('${controller.endDate}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.monetization_on, color: Colors.pink),
                      title: Text('Price'),
                      subtitle: Text('${controller.price} FCFA /Month', style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.subscriptions, color: Colors.pink),
                      title: Text('Status'),
                      subtitle: Text('Active', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
              ),
            ),

            // Call-to-Action Button
            SizedBox(height: 20),
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: Icon(Icons.credit_card, color: Colors.white),
            //   label: Text('Renew Subscription'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.pink,
            //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),),
    );
  }
}
