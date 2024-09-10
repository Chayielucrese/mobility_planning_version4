import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletRechargeController extends AppController {
  bool showButtonFalse = false;
  TokenController tokenController = Get.put(TokenController());
  String? payment_url = "";
  final amountController = TextEditingController();

  Future<http.Response> rechargeWalletEndPoint(String amount) async {
    String? token = await tokenController.retriveToken();

    return await http.put(
      Uri.parse("${Config.apiUrl}/rechargeWallet"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'amount': amount,
      }),
    );
  }

  // Function to handle form submission
  Future<void> submitForm() async {
    String amount = amountController.text;
    final response = await rechargeWalletEndPoint(amount);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      alertSuccess("${responseJson['msg']}");
      Get.toNamed(AppRoutes.driversubscription);
      // showButtonFalse = responseJson['success'] != true;
      // payment_url = responseJson['payment_url'];  

amountController.clear();
      // if (payment_url != null && payment_url!.isNotEmpty) {
      //   await _launchUrl(payment_url!);
      // }
    } else {
      alertError("An error occurred, please try again later.");
    }
  }

  
  Future<void> _launchUrl(String url) async {
    final Uri paymentUri = Uri.parse(url);
    if (!await launchUrl(paymentUri)) {
      throw Exception('Could not launch $url');
    }
  }
}
