
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subscription_form/subscription_form_ctrl.dart';

class SubscriptionFormBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  SubscriptionFormController());
 }
}