
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Wallet/wallet_ctrl.dart';

class UserWalletBinding extends Bindings {
  @override
 void dependencies(){
  Get.lazyPut(()=>  UserWalletController());
 }
}