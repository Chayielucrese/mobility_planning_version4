import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Components/TextField.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Wallet/wallet_ctrl.dart';

class UserWalletPage extends StatelessWidget {
  const UserWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserWalletController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Wallet', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Assets/Wallet-pana.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Create Wallet Form
                Text(
                  'Create Your Wallet',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                appTextField(
                  labelText: "Create wallet password",
                  icon: Icons.password,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    controller.submitForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
