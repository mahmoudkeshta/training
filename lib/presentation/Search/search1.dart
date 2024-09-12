import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Sample product data
  final List<Map<String, String>> products = [
    {"name": "Laptop Surface Go", "description": "A lightweight laptop.", "category": "laptop"},
    {"name": "Laptop Surface Pro", "description": "A powerful tablet.", "category": "laptop"},
    {"name": "DSLR Camera", "description": "Capture stunning images.", "category": "camera"},
    {"name": "Smartphone X", "description": "A powerful smartphone.", "category": "mobile"},
    {"name": "Running Shoes", "description": "Perfect for running.", "category": "shoes"},
  ];

  String selectedCategory = 'laptop';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Find Product',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (query) {
            setState(() {
              searchQuery = query;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category filter buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton('laptop'),
                _buildCategoryButton('camera'),
                _buildCategoryButton('mobile'),
                _buildCategoryButton('shoes'),
              ],
            ),
          ),
          
          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _filteredProducts().length,
              itemBuilder: (context, index) {
                return _buildProductCard(_filteredProducts()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Category button builder
  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Column(
        children: [
          Text(
            category.toUpperCase(),
            style: TextStyle(
              color: selectedCategory == category ? Colors.red : Colors.black,
              fontWeight: selectedCategory == category ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (selectedCategory == category)
            Container(
              width: 30,
              height: 2,
              color: Colors.red,
            )
        ],
      ),
    );
  }

  // Product card builder
  Widget _buildProductCard(Map<String, String> product) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              'assets/laptop_image.png', // Add your own image asset here
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),
                SizedBox(height: 4),
                Text(
                  product['description']!,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Filtering products based on category and search query
  List<Map<String, String>> _filteredProducts() {
    return products.where((product) {
      final matchesCategory = product['category'] == selectedCategory;
      final matchesSearch = product['name']!.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }
}
