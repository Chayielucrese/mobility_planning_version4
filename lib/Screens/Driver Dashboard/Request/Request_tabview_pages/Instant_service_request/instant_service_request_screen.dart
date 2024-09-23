import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Request/Request_tabview_pages/Instant_service_request/instant_service_request_ctrl.dart';

class InstanceServiceRequestPage extends StatelessWidget {
  const InstanceServiceRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch the controller
    final InstantServiceRequestController controller = Get.put(InstantServiceRequestController());

    return Scaffold(
    
      body: Obx(() {
        if (controller.requestPlan.isEmpty) {
          return Center(
            child: Text(
              'No requests available at the moment',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.requestPlan.length,
            itemBuilder: (context, index) {
              final request = controller.requestPlan[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Passenger: ${controller.username} ${controller.surname}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Pickup Location: ${request['pickUpPoint'] ?? ''}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Destination: ${request['destination'] ?? ''}',
                        style: const TextStyle(fontSize: 16,),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Number of Seats: ${request['numberOfSeats'] ?? '1'}',
                        style: const TextStyle(
                          fontSize: 16,
                          
                        ),
                      ),
                   
                       const SizedBox(height: 5),
                      Text(
                        'Date: ${request['date'] ?? ''}',
                        style: const TextStyle(
                          fontSize: 16,
                          
                        ),
                      ),
                    
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            const SizedBox(height: 5),
                      Text(
                        'Status: ${request['status'] ?? 'Pending...'}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold, color: Colors.orange
                        ),
                      ),  const SizedBox(width: 45),
                          ElevatedButton(
                            onPressed: () {
                              // Implement functionality for accepting the request
                            },
                            child: const Text('Accept Request',
                                style: TextStyle(color: Colors.white)),
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
            },
          );
        }
      }),
    );
  }
}
