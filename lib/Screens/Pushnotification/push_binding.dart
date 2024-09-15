
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Pushnotification/push_ctrl.dart';


class PushBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  PushNotificationsController());
 }
}