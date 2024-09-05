
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Vehicles/vehicle_ctrl.dart';

class DriverVehicleBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  DriverVehicleController());
 }
}