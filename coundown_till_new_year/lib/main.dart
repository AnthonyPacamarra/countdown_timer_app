import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(CountdownTimerDemo());
}

class CountdownTimerDemo extends StatefulWidget {
  @override
  _CountdownTimerDemoState createState() => _CountdownTimerDemoState();
}

class _CountdownTimerDemoState extends State<CountdownTimerDemo> {
  Timer? countdownTimer;
  Duration timeRemaining = Duration();

  @override
  void initState() {
    super.initState();
    calculateTimeRemaining();
    startTimer();
  }

  void calculateTimeRemaining() {
    final now = DateTime.now();
    final newYear = DateTime(now.year + 1, 1, 1, 0, 0, 0, 0);
    final philippinesTimeZoneOffset = Duration(hours: 8);
    final nextNewYearInPhilippines = newYear.add(philippinesTimeZoneOffset);
    timeRemaining = nextNewYearInPhilippines.difference(now);
  }

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timeRemaining.inSeconds > 0) {
        setState(() {
          timeRemaining = timeRemaining - Duration(seconds: 1);
        });
      } else {
        countdownTimer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(timeRemaining.inDays);
    final hours = strDigits(timeRemaining.inHours.remainder(24));
    final minutes = strDigits(timeRemaining.inMinutes.remainder(60));
    final seconds = strDigits(timeRemaining.inSeconds.remainder(60));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('New Year Countdown'),
          backgroundColor: Colors.black, // Background color for the AppBar
        ),
        backgroundColor: Colors.black, // Background color for the entire screen
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Countdown Timer
            Flexible(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Days
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              days,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.white, // Text color
                              ),
                            ),
                            Text(
                              'days',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white, // Text color
                              ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(width: 20),
                      // Hours
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              hours,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.white, // Text color
                              ),
                            ),
                            Text(
                              'hrs',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white, // Text color
                              ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(width: 20),
                      // Minutes
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              minutes,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.white, // Text color
                              ),
                            ),
                            Text(
                              'mins',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white, // Text color
                              ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(width: 20),
                      // Seconds
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              seconds,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.red, // Text color
                              ),
                            ),
                            Text(
                              'secs',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red, // Text color
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Image at the bottom
            Image.asset(
              'assets/family.png',
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
