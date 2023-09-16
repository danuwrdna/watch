import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class fitur1 extends StatefulWidget {
  const fitur1({super.key});

  @override
  State<fitur1> createState() => _fitur1State();
}

class _fitur1State extends State<fitur1> {
  String _currentTime = '';
  void initState() {
    super.initState();

    _updateTime();
  }

  void _updateTime() {
    setState(() {
      final now = DateTime.now().toUtc();

      final timeFormatter = DateFormat('HH:mm:ss');
      _currentTime = timeFormatter.format(now);
    });

    Future.delayed(Duration(seconds: 1), _updateTime);
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
                margin: EdgeInsets.only(top: 300),
                child: Column(
                  children: [
                    Text(
                      _currentTime,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60, // Ukuran font
                        fontWeight: FontWeight.bold, // Ketebalan font
                      ),
                    ),
                    Text(
                      "Waktu UTC",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 310),
                child: BottomAppBar(
                    color: Color.fromARGB(31, 31, 30, 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: [
                              IconButton(
                                color: Colors.yellow,
                                icon: Icon(Icons.watch),
                                onPressed: () {
                                  Navigator.pop(context);
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
                                color: Colors.white,
                                icon: Icon(Icons.run_circle),
                                onPressed: () {
                                  Navigator.pop(context);
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
