
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Wallet_Recharge/erecharge_ctrl.dart';

class WalletRechargeBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  WalletRechargeController());
 }
}