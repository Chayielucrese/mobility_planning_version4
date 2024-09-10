import 'dart:convert';
import 'dart:core';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';
import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverSubscriptionController extends AppController {
  TokenController tokens = Get.put(TokenController());

  var subscriptionPlans = <Map<String, dynamic>>[].obs;

  void onInit() {
    super.onInit();
    subscriptionDetails();
    
  }

  String name = "";
  String description = "";
  String price = "";

  Future<http.Response> fetchSubscriptionPlans() async {
    String? tok = await tokens.retriveToken();
    return await http.get(
      Uri.parse('${Config.apiUrl}/getAllReservationTtypes'),
      headers: {
        'Authorization': 'Bearer $tok',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<void> subscriptionDetails() async {
    try {
      print("heiiiiii");
      final res = await fetchSubscriptionPlans();
      if (res.statusCode == 200) {
        final response = json.decode(res.body) as Map<String, dynamic>;

        if (response.containsKey('reservationTypeList') &&
            response['reservationTypeList'] != null &&
            response['reservationTypeList'].isNotEmpty) {
          final List<dynamic> subScriptionList =
              response['reservationTypeList'];

          subscriptionPlans.value = subScriptionList.map((subscription) {
            return {
              'id': subscription['id'],
              'name': subscription['name'],
              'description': subscription['description'],
              'price': subscription['price'],
              'terms': subscription['terms'],
              'recommendation': subscription['subscription']
            };
          }).toList();
          update();
        } else {
          print("No requests found or the list is empty.");
          subscriptionPlans.value = [];
        }

        print("${subscriptionPlans[0]['name']}: your array");
      } else {
        print('Failed to load subscription plans');
      }
    } catch (e) {
      print("Error occurred while fetching subscriptionDetails: $e");
    }
  }

  Future<void> getSubcriptionId(int id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt("id", id);
  }
    Future<void> getSubcriptionName(String name) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("name", name);
  }

  //subscribe

  TokenController tokenController = Get.put(TokenController());
  // LocalData profileInfo = Get.put(LocalData());
  // final walletPasswordController = TextEditingController();
  String subName = '';



  // String name = "";
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


  String? isProcessing = "";  
  bool hasSubscribe = false;
  Future<void> subscriptionSubmit() async {
  
    final response = await performSubscription();
      
    if (response.statusCode == 200 ||response.statusCode == 201 ) {
      final responsejson = json.decode(response.body);
       hasSubscribe = true;
       print("hello deart");
      alertSuccess('${responsejson['msg']}');
    } else if (response.statusCode == 404) {
      Get.toNamed(AppRoutes.userwallet);
      final responseJson = json.decode(response.body);
      alertSuccess("${responseJson['msg']}");
      // Get.toNamed(AppRoutes.subsriptiondetails);
    } 
    else if (response.statusCode == 400) {
      Get.toNamed(AppRoutes.walletrecharge);
      final erroJson = json.decode(response.body);
      alertError("${erroJson['msg']}");
    }
    else {
      final erroJson = json.decode(response.body);
      alertError("${erroJson['msg']}");
    }
  }
}
