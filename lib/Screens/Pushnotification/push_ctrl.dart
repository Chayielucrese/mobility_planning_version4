// push_notifications_controller.dart
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Controller/app_ctrl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class PushNotificationsController extends AppController {
  var debugLabelString = "".obs;
  var enableConsentButton = false.obs;
  String? emailAddress;
  String? smsNumber;
  String? externalUserId;
  String? language;
  String? liveActivityId;

  // Change this parameter to true if you want to test GDPR privacy consent
  final bool requireConsent = false;

  @override
  void onInit() {
    super.onInit();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.consentRequired(requireConsent);

    OneSignal.initialize("242a0c6a-5ac0-42d0-ad84-aa117f90b61b");

    OneSignal.Notifications.clearAll();

    OneSignal.User.pushSubscription.addObserver((state) {
      debugLabelString.value = state.current.jsonRepresentation();
    });

    OneSignal.User.addObserver((state) {
      var userState = state.jsonRepresentation();
      print('OneSignal user changed: $userState');
    });

    OneSignal.Notifications.addClickListener((event) {
      debugLabelString.value = 
          "Clicked notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    });

    enableConsentButton.value = requireConsent;
  }

  void handleSendTags() {
    OneSignal.User.addTagWithKey("test2", "val2");
    var sendTags = {'test': 'value', 'test2': 'value2'};
    OneSignal.User.addTags(sendTags);
  }


// void getPlayerId() async {
//   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

//   // Initialize OneSignal with your App ID
//   OneSignal.shared.setAppId("YOUR_ONESIGNAL_APP_ID");

//   // Get the player ID
//   var status = await OneSignal.shared.getDeviceState();
//   String? playerId = status?.userId;

//   if (playerId != null) {
//     print("OneSignal Player ID: $playerId");
//   } else {
//     print("Error: Unable to get player ID");
//   }
// }
  // Add other logic handling methods here (get tags, set email, remove email, etc.)
}
