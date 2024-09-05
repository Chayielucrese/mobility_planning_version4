import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Notifications/notification_ctrl.dart';

class NotifiicationBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  NotifiicationController());
 }
}