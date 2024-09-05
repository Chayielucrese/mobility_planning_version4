import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Upload/upload_ctrl.dart';

class DriverUploadBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  DriverUploadController());
 }
}