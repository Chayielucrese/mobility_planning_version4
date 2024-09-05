

import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Profile/profile_ctrl.dart';

class DriverProfileBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  DriverProfileController());
 }
}