import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:training/presentation/favorite/controller/favorite_controller.dart';
import 'package:training/presentation/home_page/controller/favoritecontroller.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

void main() {
  runApp(FavoritesApp());
}

class FavoritesApp extends StatelessWidget {
  const FavoritesApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Favorites',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FavoritesPage(),
    );
  }
}

class FavoritesPage extends StatefulWidget {
favoritecontrollerdata controller =Get.put(favoritecontrollerdata());
 late StatusRequest statusRequest;

  FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  // List of favorite items (could be fetched from a database)
  List<Map<String, dynamic>> favorites = [
    {
      'name': 'laptop surface go 2',
      'rating': 3.5,
      'price': 200,
      'image': 'https://via.placeholder.com/150', // Replace with your image link
    },
    {
      'name': 'mobile s22 ultra',
      'rating': 3.5,
      'price': 300,
      'image': 'https://via.placeholder.com/150', // Replace with your image link
    }
  ];

  // Method to remove a favorite item
  void removeFavorite(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
favoritecontrollerdata controller1 =Get.put(favoritecontrollerdata());

    return Scaffold(
      
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: GetBuilder<favoritecontrollerdata>(
        builder: (controller) {
          return 
          HandlingDataview(statusRequest: controller.statusRequest, widget: 
          ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
   final item = controller.data[index];

              //final favorite = favorites[index];
              return InkWell(
                child: ListTile(
                  leading: Image.network(controller.data[index].imageCourese!, width: 50, height: 50),
                  title: Text(controller.data[index].title!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rating: ${item.courseID} ★'),
                      Text('Price: ${controller.data[index].evaluation!} \$'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: (
                      //controller1.deletefromfavorite();
                    )//=> removeFavorite(),
                    {if (item.courseID != null ) {
                  controller.deletefromfavorite(item.courseID.toString());
                } else {
                  print('Invalid courseID, cannot delete');
                }}
                  ),
                ),
               
                    onTap: (){
                  controller.gotoshowcourse2(coursedetails(), coursemedia(), coursedetails2());
                },
              );
            
            },
            
          ));
        }
      ),
    );
  }
}
