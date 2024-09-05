
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/View_vehicles/view_vehicle_ctrl.dart';

class ViewVehicleBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  ViewVehicleController());
 }
}