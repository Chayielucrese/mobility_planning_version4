
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Welcome/welcome_ctrl.dart';

class DriverWelcomeBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  DriverWelcomeController());
 }
}