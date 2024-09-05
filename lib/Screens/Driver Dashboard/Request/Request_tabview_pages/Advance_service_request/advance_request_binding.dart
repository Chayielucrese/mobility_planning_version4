
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Request/Request_tabview_pages/Advance_service_request/advance_request_ctrl.dart';

class AdvanceServiceRequestBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  AdvanceServiceRequestController());
 }
}