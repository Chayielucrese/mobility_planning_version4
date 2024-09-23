import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:http/http.dart ' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/local_storage.retrieve.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/client_profile/client_profile_ctrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionFormController extends AppController {
  TokenController tokenController = Get.put(TokenController());
  LocalData profileInfo = Get.put(LocalData());
  final walletPasswordController = TextEditingController();
  String subName = '';
  @override
  void onInit() async {
    super.onInit();
    await retriveName();
  }

  String name = "";
  bool isWalletEmpty = false;

  Future<String?> retriveName() async {
    return await getSubscriptionName();
  }

  Future<String?> getSubscriptionName() async {
    final pref = await SharedPreferences.getInstance();
    String? name = pref.getString("name");
    print("Retrieved token: $name"); // Check what is being retrieved
    return name;
  }

  Future<int?> retriveId() async {
    return await getSubscriptionId();
  }

  Future<int?> getSubscriptionId() async {
    final pref = await SharedPreferences.getInstance();
    int? id = pref.getInt("id");
    print("Retrieved token: $id"); // Check what is being retrieved
    return id;
  }

  Future<http.Response> performSubscription() async {
    String? newToken = await tokenController.retriveToken();
    int? subscriptionId = await retriveId();
    if (subscriptionId == null) {
      print("fail to get suscription Id");
    }
    return await http.post(
      Uri.parse("${Config.apiUrl}/mySubscription/$subscriptionId"),
      headers: {
        'Authorization': 'Bearer $newToken',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<void> submitForm() async {
    final response = await performSubscription();
    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.subscriptiondetails);
    } else if (response.statusCode == 404) {
      Get.toNamed(AppRoutes.userwallet);
      final erroJson = json.decode(response.body);
      alertError("${erroJson['msg']}");
    } else if (response.statusCode == 400) {
      Get.toNamed(AppRoutes.walletrecharge);
      final erroJson = json.decode(response.body);
      alertError("${erroJson['msg']}");
    } else if (response.statusCode == 201) {
      final responsejson = json.decode(response.body);
      alertSuccess('${responsejson['msg']}');

      Get.toNamed(AppRoutes.subscriptiondetails);
    } else {
      final erroJson = json.decode(response.body);
      alertError("${erroJson['msg']}");
    }
  }
}
