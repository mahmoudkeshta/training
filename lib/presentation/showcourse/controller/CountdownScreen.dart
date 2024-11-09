import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/showcourse/showcourse.dart';

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  late Timer _timer;
  int _start = 10; // الوقت المتبقي بالثواني

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        timer.cancel();
        Get.to(ExamScreen()); // افتح شاشة الامتحان
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختبار العد التنازلي'),
      ),
      body: Center(
        child: Text(
          'الوقت المتبقي: $_start ثانية',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


