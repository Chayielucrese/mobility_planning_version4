
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/ReservationWaitingPage/waitting_ctrl.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RideDetails/ride_details_ctrl.dart';


class WaitngBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  WaitingController());
 }
}