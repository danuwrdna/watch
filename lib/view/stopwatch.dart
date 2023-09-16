import 'package:flutter/material.dart';
import 'dart:async';

import 'package:watch2/view/fitur1.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

Color iconButtonColor = Colors.white;

class _StopwatchState extends State<Stopwatch> {
  bool isRunning = false;
  String currentTime = "00.00,00";
  int seconds = 0;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        currentTime = formatDuration(seconds);
      });
    });
  }

  void stopTimer() {
    timer.cancel();
  }

  void resetTimer() {
    timer.cancel();
    setState(() {
      seconds = 0;
      currentTime = "00.00,00";
    });
  }

  String formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final remainingSeconds = seconds % 60;
    return "$hours:$minutes:$remainingSeconds";
  }

  void toggleTimer() {
    if (isRunning) {
      stopTimer();
    } else {
      startTimer();
    }
    setState(() {
      isRunning = !isRunning;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 200),
                    child: Text(
                      currentTime,
                      style: TextStyle(color: Colors.white, fontSize: 80),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 100),
                    child: Material(
                      elevation: 4.0,
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Color.fromARGB(31, 31, 30, 30),
                      child: InkWell(
                        onTap: () {
                          resetTimer();
                        },
                        child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Center(
                                child: Text(
                              "Reset",
                              style: TextStyle(color: Colors.white),
                            ))),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 190, top: 100),
                    child: Material(
                      elevation: 4.0,
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Color.fromARGB(31, 31, 30, 30),
                      child: InkWell(
                        onTap: () {
                          toggleTimer();
                        },
                        child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Center(
                                child: Text(
                              isRunning ? "Berhenti" : "Mulai",
                              style: TextStyle(color: Colors.white),
                            ))),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 107),
                child: BottomAppBar(
                    color: Color.fromARGB(31, 31, 30, 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: [
                              IconButton(
                                color: Colors.white,
                                icon: Icon(Icons.watch),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => fitur1()),
                                  );
                                },
                              ),
                              Text(
                                'Jam',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                color: Colors.yellow,
                                icon: Icon(Icons.run_circle),
                                onPressed: () {
                                  resetTimer();
                                },
                              ),
                              Text(
                                'Stop Watch',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
