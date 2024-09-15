// push_notifications_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_planning_version4/Screens/Pushnotification/push_ctrl.dart';


class PushNotificationPage extends StatelessWidget {
  const PushNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PushNotificationsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('OneSignal Flutter Demo'),
        backgroundColor: Color.fromARGB(255, 212, 86, 83),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Obx(() => Table(
            children: [
              TableRow(children: [
                OneSignalButton("Send Tags", controller.handleSendTags, !controller.enableConsentButton.value)
              ]),
              TableRow(children: [
                Container(
                  child: Text(controller.debugLabelString.value),
                  alignment: Alignment.center,
                )
              ]),
              // Add more table rows for other buttons and inputs
            ],
          )),
        ),
      ),
    );
  }
}

class OneSignalButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool enabled;

  const OneSignalButton(this.title, this.onPressed, this.enabled);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 212, 86, 83),
              disabledBackgroundColor: Color.fromARGB(180, 212, 86, 83),
              padding: EdgeInsets.all(8.0),
            ),
            child: Text(title),
            onPressed: enabled ? onPressed : null,
          ),
        ]),
        TableRow(children: [
          SizedBox(height: 8.0),
        ]),
      ],
    );
  }
}
