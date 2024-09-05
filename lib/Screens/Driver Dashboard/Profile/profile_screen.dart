import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mobility_planning_version4/Components/TextField.dart';
import 'package:mobility_planning_version4/Controller/local_storage.retrieve.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Profile/profile_ctrl.dart';

class DriverProfilePage extends StatelessWidget {
  DriverProfilePage({super.key});
  final LocalData data = Get.put(LocalData());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverProfileController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.pink,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.pink),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image
              Center(
                child: GestureDetector(
                  onTap: () => controller.pickImage(0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.profilePicture != null
                        ? NetworkImage(controller.profilePicture)
                        : const AssetImage('Assets/Profile pic-cuate.png')
                            as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Driver's Name)
              Text("${controller.name}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Driver's Email
                  Text(
                    "${controller.email}",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${controller.phone}",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Driver Details
              appTextField(
                labelText: "Account Password",
                icon: Icons.password,
                obscureText: true,
                controller: controller.passwordController,
              ),
              const SizedBox(height: 20),
              appTextField(
                labelText: "Phone",
                icon: Icons.phone,
                controller: controller.phoneController,
              ),
              const SizedBox(height: 20),
              appTextField(
                labelText: "Email",
                icon: Icons.email,
                controller: controller.emailController,
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  controller.submitForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Save Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
