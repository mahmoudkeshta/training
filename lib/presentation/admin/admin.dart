import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/admin/BlogPostPage.dart';
import 'package:training/presentation/admin/Controller/CoursePageController.dart';
import 'package:training/presentation/admin/advertisementsadd.dart';
import 'package:training/presentation/admin/course.dart';
import 'package:training/presentation/login/login.dart';
import 'package:training/presentation/signup/models/crud.dart';
import 'DepartmentPage.dart';

void main() {
  Get.put(Crud());
  runApp(const Admin());
}

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
      routes: {
        '/department': (context) => DepartmentPage(),
        '/course/courseadd': (context) => CoursePage(),
        '/course/coursedays': (context) => SchedulePage(),
        '/course/coursemedia': (context) => MediaPage(),
        '/course/coursevideo': (context) => VideoPage(),
        '/advertisements': (context) => RecordPage(),
        '/popularbloggers': (context) => BlogPostPage(),
        '/settings/Logout': (context) => LoginP(),
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Myservices myservices = Get.find();
    String? admin2 = myservices.sharedPreferences.getString("admin");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.blue),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(context, Icons.dashboard, 'Dashboard', '/'),
                  if (admin2 == "2")
                    _buildDrawerItem(context, Icons.campaign, 'Advertisements', '/advertisements')
                  else
                    _buildDrawerItem(context, Icons.campaign, 'View Courses', ''),
                  if (admin2 == "2")
                    CourseExpansionTile()
                  else
                    _buildLimitedCourseExpansion(context),
                  _buildDrawerItem(context, Icons.people_outline_sharp, 'Popular Bloggers', '/popularbloggers'),
                  _buildUsersExpansion(context),
                  _buildDrawerItem(context, Icons.person, 'Employee', '/employee'),
                  if (admin2 == "2")
                    _buildDrawerItem(context, Icons.dangerous_rounded, 'Department', '/department')
                  else
                    _buildDrawerItem(context, Icons.comment, 'Comment', '/comment'),
                  _buildSettingsExpansion(context),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            admin2 == "2"
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoCard(title: 'CPU Traffic', value: '90%', icon: Icons.memory, color: Colors.blue),
                      InfoCard(title: 'Likes', value: '41,410', icon: Icons.thumb_up, color: Colors.red),
                      InfoCard(title: 'Sales', value: '760', icon: Icons.shopping_cart, color: Colors.green),
                      InfoCard(title: 'New Members', value: '2,000', icon: Icons.group, color: Colors.orange),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoCard(title: 'Likes', value: '41,410', icon: Icons.thumb_up, color: Colors.red),
                      InfoCard(title: 'Sales', value: '760', icon: Icons.shopping_cart, color: Colors.green),
                      InfoCard(title: 'New Members', value: '2,000', icon: Icons.group, color: Colors.orange),
                    ],
                  ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('Monthly Recap Report', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    SizedBox(
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

  ListTile _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.popAndPushNamed(context, route);
      },
    );
  }

  ExpansionTile _buildLimitedCourseExpansion(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.add_card),
      title: Text('Course'),
      children: [
        _buildDrawerItem(context, Icons.insert_drive_file, 'Course Media', '/course/coursemedia'),
        _buildDrawerItem(context, Icons.video_library, 'Course Video', '/course/coursevideo'),
        _buildDrawerItem(context, Icons.location_on, 'Online Training Location', '/course/onlinetraininglocation'),
      ],
    );
  }

  ExpansionTile _buildUsersExpansion(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.people_alt_sharp),
      title: Text('Users'),
      children: [
        _buildDrawerItem(context, Icons.people_outlined, 'User Course Registration', '/users/usercourseregistration'),
      ],
    );
  }

  ExpansionTile _buildSettingsExpansion(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.settings),
      title: Text('Settings'),
      children: [
        _buildDrawerItem(context, Icons.logout, 'Log out', '/settings/Logout'),
      ],
    );
  }
}

class CourseExpansionTile extends StatefulWidget {
  @override
  _CourseExpansionTileState createState() => _CourseExpansionTileState();
}

class _CourseExpansionTileState extends State<CourseExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.add_card),
      title: Text('Course'),
      children: _isExpanded
          ? [
              _buildDrawerItem(context, Icons.candlestick_chart, 'Course Add', '/course/courseadd'),
              _buildDrawerItem(context, Icons.calendar_view_day, 'Course Days', '/course/coursedays'),
              _buildDrawerItem(context, Icons.insert_drive_file, 'Course Media', '/course/coursemedia'),
              _buildDrawerItem(context, Icons.video_library, 'Course Video', '/course/coursevideo'),
              _buildDrawerItem(context, Icons.location_on, 'Online Training Location', '/course/onlinetraininglocation'),
            ]
          : [],
      onExpansionChanged: (bool expanding) => setState(() => _isExpanded = expanding),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.popAndPushNamed(context, route);
      },
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const InfoCard({
    super.key,
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
            Text(title, style: TextStyle(color: Colors.white)),
            Text(value, style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

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
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        borderData: FlBorderData(show: true),
      ),
    );
  }
}
