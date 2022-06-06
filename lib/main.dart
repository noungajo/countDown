import 'dart:async';

import 'package:flutter/material.dart';

import 'buttonwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CountDown(title: 'count Down'),
    );
  }
}

class CountDown extends StatefulWidget {
  const CountDown({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  String msg = "";
  Timer? timer;
  startTimer() {
    //s'écute chaque seconde, et on crée un call back qui s'exécute cahque seconde
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      //ici on décrémente le temps total de chaque seconde
      setState(() {
        if (seconds > 0) seconds--;
        if (seconds == 0) {
          msg = "Ici c'est Paris";
          seconds = maxSeconds;
        }
        ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          buildTime(),
          SizedBox(
            height: 20,
          ),
          buildButtons(),
          SizedBox(
            height: 20,
          ),
          Text(
            msg,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 80),
          )
        ]),
      ),
    );
  }

// construit le bouton
  Widget buildButtons() {
    return ButtonWidget(
      text: 'Start Timer!',
      onClicked: () {
        startTimer();
      },
      color: Colors.black,
      backgroundColor: Colors.white,
    );
  }

  //affiche la variation du temps
  Widget buildTime() {
    return Text(
      '$seconds',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 80),
    );
  }
}
