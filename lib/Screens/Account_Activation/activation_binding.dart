
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Account_Activation/activation_ctrl.dart';

class ActivationBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  ActivationController());
 }
}