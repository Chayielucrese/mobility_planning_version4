
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RideDetails/ride_details_ctrl.dart';


class RideDetailBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  RideDetailsController());
 }
}