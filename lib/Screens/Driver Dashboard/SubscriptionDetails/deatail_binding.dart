
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/SubscriptionDetails/detail_ctrl.dart';


class SubscriptionDetailBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  SubscriptionDetailController());
 }
}