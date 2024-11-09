import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

import 'search_controller.dart';

class ProductListScreen extends StatelessWidget {
  final TextEditingController? up;

  ProductListScreen({super.key, this.up});

  final controller = Get.put(SearchController1 ());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(212, 157, 47, 1),
        title: TextFormField(
          controller: up,
          decoration: const InputDecoration(
            hintText: 'Find Product',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: (query) {
            controller.updateSearchText(query, category: controller.selectedCategory.value);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              controller.search();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategorySelector(),
          Expanded(
            child: Obx(() {
              if (controller.statusRequest.value == StatusRequest.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.data.isEmpty) {
                return const Center(child: Text('No products found.'));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(controller.data[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    const categories = ['All', 'Design', 'Programming', 'Languages', 'Health'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories.map((category) => _buildCategoryButton(category)).toList(),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        controller.selectedCategory.value = category == 'All' ? '' : category;
        controller.search();
      },
      child: Column(
        children: [
          Text(
            category.toUpperCase(),
            style: TextStyle(
              color: controller.selectedCategory.value == category ? Colors.red : Colors.black,
              fontWeight: controller.selectedCategory.value == category ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (controller.selectedCategory.value == category)
            Container(
              width: 30,
              height: 2,
              color: Colors.red,
            ),
        ],
      ),
    );
  }

  Widget _buildProductCard(coursedetails product) {
    return Card(
      elevation: 2,
      child: HandlingDataview(
        statusRequest: controller.statusRequest.value,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.Image_courese != null
                ? Image.network(
                    product.Image_courese!,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                  )
                : Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(child: Text('No Image')),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.courseTitle ?? 'No Title',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.departmentName ?? 'No Description',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Action for "View Details" button
                    },
                    child: const Text('View Details'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
