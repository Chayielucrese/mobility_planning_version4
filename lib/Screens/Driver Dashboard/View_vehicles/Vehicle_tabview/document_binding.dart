
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/View_vehicles/Vehicle_tabview/document_ctrl.dart';

class DriverVehicleDocumentBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  DriverVehicleDocumentController());
 }
}