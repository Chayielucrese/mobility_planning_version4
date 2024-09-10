import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationWaitingPage extends StatelessWidget {
  // final String userName;
  // final String userSurname;

 

  Future<void> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Exit Confirmation',
            style: TextStyle(color: Colors.pink, fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Are you sure you want to quit this page?',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.pink),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Quit',
                style: TextStyle(color: Colors.pink),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevents popping back
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: Text(
            'Reservation Pending',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Colors.pink,
          automaticallyImplyLeading: false, // Removes the back arrow
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  'Assets/driver.png',
                  width: 200,
                  height: 130,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Your Request Was Received  Succcussfully,  ",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "We are getting your ride please be patient you will receive a notification or a call shortly.",
                style: TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  _showExitConfirmationDialog(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  side: BorderSide(color: Colors.pink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
