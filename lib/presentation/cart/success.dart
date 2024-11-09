import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:training/core/app_export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
      ),
      home: SuccessPage(),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operation Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتويات عموديًا
          crossAxisAlignment: CrossAxisAlignment.center, // توسيط المحتويات أفقيًا
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Payment has been successfully made!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
             
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Thank you for your payment.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.homeContainerScreen);
                // يمكن إضافة حدث هنا إذا كنت بحاجة إلى الانتقال لصفحة أخرى
                print('Navigating to another page');
              },
              child: Text('Go back to the main page'),
            ),
          ],
        ),
      ),
    );
  }
}
