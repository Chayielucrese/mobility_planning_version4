import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/client_profile/client_profile_ctrl.dart';

void main() {
  runApp(ClientProfileApp());
}

class ClientProfileApp extends StatelessWidget {
  const ClientProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client Profile',
      theme: ThemeData(
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ClientProfilePage(),
    );
  }
}

class ClientProfilePage extends StatelessWidget {
  ClientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientProfileController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile Info',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: controller.profilePicture != null
                          ? NetworkImage(controller.profilePicture)
                          : AssetImage('Assets/Profile pic-cuate.png'),
                      backgroundColor: Colors.pink,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon:
                          Icon(Icons.camera_alt, color: Colors.white, size: 30),
                      onPressed: () {
                        // Action for picking an image
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildProfileInfo(),
                  ),
                ),
              ),
              SizedBox(height: 34),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  showEditProfileAlertDialog(context);
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildProfileInfo() {
    ClientProfileController controller = Get.put(ClientProfileController());
    return [
      _buildInfoRow("Name", controller.name, Icons.person),
      _buildInfoRow("Phone", controller.phone, Icons.phone),
      _buildInfoRow("Email", controller.email, Icons.email),
      _buildInfoRow("Address", controller.city, Icons.location_on),
    ];
  }

  List<Widget> _buildEditableFields() {
    ClientProfileController controller = Get.put(ClientProfileController());
    return [
      Center(
        child: GestureDetector(
          onTap: () => controller.pickImage(0),
          child: CircleAvatar(
            radius: 60,
           backgroundImage: controller.image != null
                    ? FileImage(controller.image!) 
                    : controller.profilePicture.isNotEmpty
                        ? NetworkImage(controller.profilePicture)
                        : AssetImage('Assets/Profile pic-cuate.png'),
            backgroundColor: Colors.pink,
          ),
        ),
      ),
      SizedBox(height: 16),
      _buildTextField(
        controller: controller.passwordController,
        label: "Password",
        icon: Icons.person,
      ),
      SizedBox(height: 16),
      _buildTextField(
        controller: controller.phoneController,
        label: "Phone Number",
        icon: Icons.phone,
      ),
      SizedBox(height: 16),
      _buildTextField(
        controller: controller.emailController,
        label: "Email",
        icon: Icons.email,
      ),
      SizedBox(height: 16),
      _buildTextField(
        controller: controller.cityController,
        label: "Address",
        icon: Icons.location_on,
      ),
    ];
  }

  void showEditProfileAlertDialog(BuildContext context) {
        ClientProfileController controller = Get.put(ClientProfileController());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _buildEditableFields(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.pink)),
            ),
            ElevatedButton(
              onPressed: () {
              controller.submitForm(context);// Close the dialog after saving
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink),
          SizedBox(width: 12),
          Text(
            "$label:",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.pink),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
