
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Request/Request_tabview_pages/Instant_service_request/instant_service_request_ctrl.dart';

class InstantServiceRequestBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  InstantServiceRequestController());
 }
}