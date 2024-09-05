
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/SignUp/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  SignupController());
 }
}