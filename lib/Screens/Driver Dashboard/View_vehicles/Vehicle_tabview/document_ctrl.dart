import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_planning_version4/Config/default_api_link.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:mobility_planning_version4/Controller/token_ctrl.dart';

class DriverVehicleDocumentController extends AppController {
  TokenController token = Get.put(TokenController());

  String CNI = "";
  String vehiclePhoto = "";
  String drivingLicense = "";
  String vehicleRegistrationCertificate = "";
  String vehicleSalesCertificate = "";
  String vehicleRoadWorthinessReport = "";
  String vehicleInsuranceCertificate = "";

  @override
  void onInit() {
    super.onInit();
    userDocuments(); // Assuming this function loads the documents
  }

  Future<void> userDocuments() async {
    try {
      final res = await getDocuments();
      if (res.statusCode == 200) {
        final response = json.decode(res.body);
        vehiclePhoto = response['msg']['vehiclePhoto'] ?? "";
        CNI = response['msg']['CNI'] ?? "";
        drivingLicense = response['msg']['drivingLicense'] ?? "";
        vehicleRegistrationCertificate =
            response['msg']['vehicleRegistrationCertificate'] ?? "";
        vehicleSalesCertificate =
            response['msg']['vehicleSalesCertificate'] ?? "";
        vehicleRoadWorthinessReport =
            response['msg']['vehicleRoadWorthinessReport'] ?? "";
        vehicleInsuranceCertificate =
            response['msg']['vehicleInsuranceCertificate'] ?? "";

        update();
        print('$drivingLicense: $vehiclePhoto : $CNI, $vehicleInsuranceCertificate');
      } else {
        print("Failed to get userDocuments: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred while fetching userDocuments: $e");
    }
  }

  Future<http.Response> getDocuments() async {
    String? newToken = await token.retriveToken();
    return await http.get(
      Uri.parse("${Config.apiUrl}/viewUploadedDocuments"),
      headers: {
        'Authorization': 'Bearer $newToken',
        'Content-Type': 'application/json',
      },
    );
  }
}
