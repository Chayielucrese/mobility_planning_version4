
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subcription_ctrl.dart';

class DriverSubscriptionBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  DriverSubscriptionController());
 }
}