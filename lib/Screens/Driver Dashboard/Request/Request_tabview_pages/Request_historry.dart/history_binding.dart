
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Request/Request_tabview_pages/Request_historry.dart/history_controller.dart';

class RequestHistoryBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  RequestHistoryController());
 }
}