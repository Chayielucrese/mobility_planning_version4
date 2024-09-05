import 'package:flutter/material.dart';

class SubscribeNowPage extends StatelessWidget {
  const SubscribeNowPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subscribe Now",
          style: TextStyle(
            color: Colors.pink,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pink),
      ),
      resizeToAvoidBottomInset: true, // Ensure the scaffold adjusts to keyboard
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plan Details
            Text(
              "Plan Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Plan: ",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Price: ",
              style: TextStyle(fontSize: 18, color: Colors.pink),
            ),
            Text(
              "Description: ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Payment Method Selection
            const Text(
              "Select Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset('assets/images/mtn_logo.png', width: 40, height: 40),
                SizedBox(width: 10),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("MTN Mobile Money"),
                    value: "MTN Mobile Money",
                    groupValue: null, // No state management
                    onChanged: (value) {
                      // No state change
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/images/orange_logo.png', width: 40, height: 40),
                SizedBox(width: 10),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Orange Money"),
                    value: "Orange Money",
                    groupValue: null, // No state management
                    onChanged: (value) {
                      // No state change
                    },
                  ),
                ),
              ],
            ),

            // Subscribe Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle subscription process (add logic as needed)
                },
                child: Text('Subscribe Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
