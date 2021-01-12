import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hot_app/services/calls_and_messages_service.dart';
import 'package:hot_app/services/service_locator.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Richard Germaine Dev Card',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyDevCard(),
    );
  }
}

class MyDevCard extends StatefulWidget {
  @override
  DevCard createState() => DevCard();
}

class DevCard extends State<MyDevCard> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String number = "+1123456789";
  final String email = "rlgerma92@outlook.com";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
          // maintainBottomViewPadding: true,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage("images/me.jpeg"),
              ),
              Text(
                'Richard Germaine',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Billions',
                  color: Colors.white,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              RaisedButton(
                onPressed: () => _service.call(number),
                child: Card(
                  color: Colors.grey.shade600,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.yellow.shade200,
                    ),
                    title: Text(
                      '+1 123 456 789',
                      style: TextStyle(
                        color: Colors.cyanAccent.shade100,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () => _service.sendEmail(email),
                child: Card(
                  color: Colors.grey.shade600,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.yellow.shade200,
                    ),
                    title: Text(
                      'rlgerma92@outlook.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.cyanAccent.shade100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
