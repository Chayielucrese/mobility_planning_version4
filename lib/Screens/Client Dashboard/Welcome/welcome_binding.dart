import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Welcome/welcome_ctrl.dart';

class ClientWelcomeBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  ClientWelcomeController());
 }
}