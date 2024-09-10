
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Booking_history/booking_ctrl.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/client_profile/client_profile_ctrl.dart';

class ClientBookingHistoryBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  ClientBookingHistoryController());
 }
}