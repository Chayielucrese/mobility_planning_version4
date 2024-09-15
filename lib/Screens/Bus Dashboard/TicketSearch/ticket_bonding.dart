
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Bus%20Dashboard/TicketSearch/ticket_ctrl.dart';


class BusTicketSearchBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  BusTicketSearchController());
 }
}