import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Statistics/statistics_ctrl.dart';

class DriverDashboardBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  DriverDashboardController());
 }
}