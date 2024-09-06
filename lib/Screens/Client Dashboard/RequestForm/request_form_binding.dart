
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RequestForm/request_form_ctrl.dart';


class RequestFormBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  RequestFormController());
 }
}