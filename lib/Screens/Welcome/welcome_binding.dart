
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Welcome/welcome_ctrl.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeCtrl());
  }
}
