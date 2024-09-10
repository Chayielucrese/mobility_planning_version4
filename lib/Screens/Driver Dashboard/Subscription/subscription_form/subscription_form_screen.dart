import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobility_planning_version4/Components/TextField.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/client_profile/client_profile_ctrl.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subscription_form/subscription_form_ctrl.dart';

class SubscribeNowPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  ClientProfileController profileInfo = Get.put(ClientProfileController());
  SubscriptionFormController subInfo = Get.put(SubscriptionFormController());
  // Form fields controllers


  SubscribeNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: ((didpop){if(didpop){return;}else{Get.toNamed(AppRoutes.driverStats);}}),
    child:Scaffold(
      appBar: AppBar(
        title: Text(
          "Subscribe Now",
          style: TextStyle(
            color: Colors.pink,
            fontSize: 20,
        
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pink),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Instant Serice Only",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Center(child: Text("Full Name: ${profileInfo.name.toUpperCase()} ${profileInfo.surname.toUpperCase()}",  style: TextStyle(fontSize: 17),)),
              SizedBox(height: 15),
               Center(child: Text("Email: ${profileInfo.email.toUpperCase()} ", style: TextStyle(fontSize: 17),)),
           
              SizedBox(height: 15),
                
               Center(child: Text("Confirm  subscription with wallet password", style: TextStyle(color: Colors.pink),)),
           
              appTextField(
                controller: subInfo.walletPasswordController,
              labelText: "Wallet Password",
              icon: Icons.password_rounded
              ),
              SizedBox(height: 15),
             
        
              Center(
                child: ElevatedButton(
                  onPressed: () {
                 subInfo.submitForm();
                 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Subscribe Now", style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      )
      ),
    );
  }
}
