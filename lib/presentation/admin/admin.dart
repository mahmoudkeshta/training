import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:training/presentation/admin/BlogPostPage.dart';
import 'package:training/presentation/admin/Controller/CoursePageController.dart';
import 'package:training/presentation/admin/advertisementsadd.dart';
import 'package:training/presentation/admin/course.dart';
import 'package:training/presentation/signup/models/crud.dart';

import 'DepartmentPage.dart';

void main() {
    Get.put(Crud());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
       routes: {
        '/department': (context) => DepartmentPage(),
        '/course/courseadd': (context) => CoursePage(),
        '/course/coursedays': (context) => SchedulePage(),
        '/course/coursemedia': (context) => MediaPage(),
        '/course/coursevideo': (context) => VideoPage(),
        '/advertisements': (context) => RecordPage(),
        '/popularbloggers': (context) => BlogPostPage(),
        
        // باقي المسارات
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: '/',
            icon: Icons.dashboard,
          ),
        

           AdminMenuItem(
            title: 'advertisements',
            route: '/advertisements',
            icon: Icons.campaign,
            
          ),

           
           AdminMenuItem(
            title: 'Course',
            route: '/course',
            icon: Icons.add_card,
            children: [
               AdminMenuItem(
                title: 'courseadd',
                route: '/course/courseadd',
            icon: Icons.candlestick_chart,

              ),
              AdminMenuItem(
                title: 'coursedays',
                route: '/course/coursedays',
            icon: Icons.calendar_view_day,

              ),
              AdminMenuItem(
                title: 'coursemedia',
                route: '/course/coursemedia',
              ),
          AdminMenuItem(
                title: 'coursevideo',
                route: '/course/coursevideo',
              ),
              AdminMenuItem(
                title: 'onlinetraininglocation',
                route: '/course/onlinetraininglocation',
              ),

            ],
          ),

          AdminMenuItem(
            title: 'popular bloggers',
            route: '/popularbloggers',
            icon: Icons.people_outline_sharp,
          ),

             AdminMenuItem(
            title: 'Users',
            route: '/users',
            icon: Icons.people_alt_sharp,

             children: [
              AdminMenuItem(
                title: 'usercourseregistration',
                route: '/users/usercourseregistration',
            icon: Icons.people_outlined,

              ),
             

            ],
          ),

            AdminMenuItem(
            title: 'Employee',
            route: '/employee',
            icon: Icons.person,
          ),
  AdminMenuItem(
            title: 'department',
            route: '/department',
            icon: Icons.dangerous_rounded,
          ),

             AdminMenuItem(
            title: 'comment',
            route: '/comment',
            icon: Icons.comment,
          ),
         
  AdminMenuItem(
            title: 'Settings',
            route: '/settings',
            icon: Icons.settings,
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
           final route = item.route;
  if (route != null) {
    Navigator.pushNamed(context, route);
  } else {
    // Handle the case where route is null
    // For example, you could show an error message or redirect to a default route
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Route is not defined')),
    );
  }
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                InfoCard(
                  title: 'CPU Traffic',
                  value: '90%',
                  icon: Icons.memory,
                  color: Colors.blue,
                ),
                InfoCard(
                  title: 'Likes',
                  value: '41,410',
                  icon: Icons.thumb_up,
                  color: Colors.red,
                ),
                InfoCard(
                  title: 'Sales',
                  value: '760',
                  icon: Icons.shopping_cart,
                  color: Colors.green,
                ),
                InfoCard(
                  title: 'New Members',
                  value: '2,000',
                  icon: Icons.group,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Monthly Recap Report',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 200,
                      child: LineChartWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 5),
              FlSpot(1, 25),
              FlSpot(2, 100),
              FlSpot(3, 75),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.3),
            ),
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        borderData: FlBorderData(show: true),
      ),
    );
  }
}

