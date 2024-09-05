

import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Login/Login_ctrl.dart';

class LoginBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  LoginController());
 }
}