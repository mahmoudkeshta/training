import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/all_questions/Controller/gradescontroller.dart';

import 'package:training/presentation/home_page/models/HandlingDataview.dart';


class ResultsScreen extends StatelessWidget {
  final gradescontroller controller = Get.put(gradescontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نتائج الامتحانات'),
        backgroundColor: const Color.fromRGBO(212, 157, 47, 1),
        centerTitle: true,
      ),
      body: GetBuilder<gradescontroller>(
        builder: (controller) {
          return
                    HandlingDataview(statusRequest: controller.statusRequest, widget:
           ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              final result = controller.data[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          result.imageCourese!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              result.title.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'المدرس: ${result.adminID}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'العلامة: ${result.score}%',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'وقت التقديم: ${result.resultExamDate}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
