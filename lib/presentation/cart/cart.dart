import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/cart/controller/cartcontroller.dart';
import 'package:training/core/app_export.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final Cartcontroller controller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: const Color.fromRGBO(212, 157, 47, 1),
      ),
      body: GetBuilder<Cartcontroller>(
        builder: (controller) {
          return HandlingDataview(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "${controller.data[index].imageCourese}",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.data[index].title}",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${controller.data[index].price} AED",
                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                              ),
                              Text(
                                "${controller.data[index].evaluation}",
                                style: const TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.deepPurple),
                          onPressed: () {
                            controller.remove(controller.data[index].cartItem.toString());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: GetBuilder<Cartcontroller>(
        builder: (controller) {
          return BottomAppBar(
            color: Colors.white,
            elevation: 10,
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: ${controller.total.toStringAsFixed(2)} AED',
                    style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.payNow();
                        },
                        child: const Text('Pay Now'),
                        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(212, 157, 47, 1)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.payWithPaypal(context);
                        },
                        child: const Text('PayPal'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
