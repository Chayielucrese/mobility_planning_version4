import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobility_planning_version4/Components/TextField.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Wallet_Recharge/erecharge_ctrl.dart';

import '../../../Routes/app_routes.dart';

class WalletRechargePage extends StatelessWidget {
  WalletRechargeController controller = Get.put(WalletRechargeController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: ((didpop) {
        if (didpop) {
          return;
        } else {
          Get.toNamed(AppRoutes.driversubscription);
        }
      }),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Recharge Wallet',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'Assets/Wallet-pana.png'), // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Recharge Your Wallet',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                appTextField(
                    controller: controller.amountController,
                    keyboardType: TextInputType.number,
                    labelText: "Amount to Recharge",
                    icon: Icons.account_balance),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.submitForm();

                    // if (!controller.showButtonFalse) {
                    //   _showDeleteConfirmationDialog(
                    //       context, controller.showButtonFalse);
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text(
                    'Recharge',
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

void _showDeleteConfirmationDialog(BuildContext context, bool showButtonFalse) {
  WalletRechargeController controller = Get.put(WalletRechargeController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Payment Confirmation',
          style: TextStyle(
            color: Colors.pink,
          ),
        ),
        content: Text('Press Continue to Proceed'),
        actions: [
          TextButton(
            child: Text('Cancel', style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.pink),
            ),
            onPressed: () {
              // controller.launchUrl(controller.payment_url!);
            },
          ),
        ],
      );
    },
  );
}
