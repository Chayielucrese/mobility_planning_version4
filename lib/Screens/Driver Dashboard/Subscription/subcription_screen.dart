import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Components/BottomNavigator.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subcription_ctrl.dart';

class DriverSubscriptionPage extends StatelessWidget {
  const DriverSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverSubscriptionController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Subscriptions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBar:
            buildBottomNavigation(AppRoutes.driversubscription),
        body: controller.subscriptionPlans.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(15.0),
                itemCount: controller.subscriptionPlans.length,
                itemBuilder: (context, index) {
                  final entry = controller.subscriptionPlans[index];
                  return _buildSubscriptionCard(
                    name: entry['name'],
                    price: entry['price'].toString(),
                    description: entry['description'],
                    onPressed: () {
                      Get.toNamed(AppRoutes.subscriptionform);
                      controller.getSubcriptionId(entry['id']);
                      controller.getSubcriptionName(entry['name']);
                      print("helllo");
                    },
                  );
                },
              ),
      ),
    );
  }
}

Widget _buildSubscriptionCard({
  required String name,
  required String price,
  required String description,
  required VoidCallback onPressed,
}) {
  return Card(
    elevation: 4,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Price: $price FCFA/Month",
            style: TextStyle(
                fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            " $description",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  'Subscribe Now',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
