import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobility_planning_version4/Components/TextField.dart';

import '../../../Routes/app_routes.dart';

class WalletRechargePage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: ((didpop) {
        if (didpop) {
          return;
        } else {
          // Get.toNamed(AppRoutes.viewwallet);
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
        body:SingleChildScrollView(
        child:  Padding(
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
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  labelText: "Amount to Recharge",
                  icon: Icons.account_balance),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
            //  Get.toNamed(AppRoutes.login);
                
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
