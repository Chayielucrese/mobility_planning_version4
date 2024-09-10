
import 'package:get/get.dart';

import 'tracking_ctrl.dart';


class RideTrackingBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  RideTrackingController());
 }
}