
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Request/request_ctrl.dart';

class DriverRequestBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  DriverRequestController());
 }
}