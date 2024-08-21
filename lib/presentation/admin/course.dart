import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:training/presentation/admin/Controller/CourseMediaController.dart';
import 'package:training/presentation/admin/Controller/CoursePageController.dart';
import 'package:training/presentation/admin/Controller/SchedulePageController.dart';
import 'package:training/presentation/admin/Controller/VideoPageController.dart';
import 'package:training/presentation/admin/modle/Course.dart';
import 'package:training/presentation/home_page/models/course.dart';



class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final CourseController controller = Get.put(CourseController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Description';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.locationIDController,
                    decoration: const InputDecoration(
                      labelText: 'Location ID',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Location ID';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.adminIDController,
                    decoration: const InputDecoration(
                      labelText: 'Admin ID',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Admin ID';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.startDateController,
                    decoration: const InputDecoration(
                      labelText: 'Start Date (YYYY-MM-DD)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Start Date';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.endDateController,
                    decoration: const InputDecoration(
                      labelText: 'End Date (YYYY-MM-DD)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter End Date';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.imageCourseController,
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Image URL';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.evaluationController,
                    decoration: const InputDecoration(
                      labelText: 'Evaluation',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Evaluation';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.addCourse();
                      }
                    },
                    child: const Text('Add Course'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
  child: GetBuilder<CourseController>(
    builder: (controller) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,

          child: DataTable(
            columns: const [
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Course ID')),
              DataColumn(label: Text('Admin ID')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('End Date')),
              DataColumn(label: Text('Image')),
            ],
            rows: controller.course1.map<DataRow>((courseData) {
              final course1 = course.fromJson(courseData);
          
              return DataRow(
                cells: [
                  DataCell(Text(course1.title ?? 'No Title')),
                  DataCell(Text(course1.courseID?.toString() ?? 'N/A')),
                  DataCell(Text(course1.adminID?.toString() ?? 'N/A')),
                  DataCell(Text(course1.startDate ?? 'N/A')),
                  DataCell(Text(course1.endDate ?? 'N/A')),
                  DataCell(course1.imageCourese != null
                      ? Image.network(course1.imageCourese!, width: 50, height: 50, fit: BoxFit.cover)
                      : const Icon(Icons.image)),
                ],
              );
            }).toList(),
          ),
        ),
      );
    },
  ),
),

          ],
        ),
      ),
    );
  }
}



class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
    final SchedulePageControllerImg controller = Get.put(SchedulePageControllerImg());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dayOfWeekArabicController = TextEditingController();
  final TextEditingController _dayOfWeekController = TextEditingController();
  final TextEditingController _courseIdController = TextEditingController();
  
  List<Map<String, String?>> schedules = [];

  void _addSchedule() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        schedules.add({
          'Date': _dateController.text,
          'DayOfWeekArabic': _dayOfWeekArabicController.text,
          'DayOfWeek': _dayOfWeekController.text,
          'CourseID': _courseIdController.text,
        });
        _dateController.clear();
        _dayOfWeekArabicController.clear();
        _dayOfWeekController.clear();
        _courseIdController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                /**
                 *   TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date (YYYY-MM-DD)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Date';
                      }
                      return null;
                    },
                  ),
                 */
                  TextFormField(
                    controller: controller.dayOfWeekArabicController,
                    decoration: const InputDecoration(
                      labelText: 'Day of Week (Arabic)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Day of Week (Arabic)';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.dayOfWeekController,
                    decoration: const InputDecoration(
                      labelText: 'Day of Week (English)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Day of Week (English)';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.courseIdController,
                    decoration: const InputDecoration(
                      labelText: 'Course ID',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Course ID';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.addCourse,
                    child: const Text('Add Schedule'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  final schedule = schedules[index];
                  return ListTile(
                    title: Text('Date: ${schedule['Date'] ?? 'N/A'}'),
                    subtitle: Text(
                      'Day (Arabic): ${schedule['DayOfWeekArabic'] ?? 'N/A'}\n'
                      'Day (English): ${schedule['DayOfWeek'] ?? 'N/A'}\n'
                      'Course ID: ${schedule['CourseID'] ?? 'N/A'}',
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    tileColor: index.isEven ? Colors.grey.shade200 : Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
    final courseMediaControllerImg controller = Get.put(courseMediaControllerImg());

  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _courseIdController = TextEditingController();
  final TextEditingController _mediaTypeController = TextEditingController();
  final TextEditingController _mediaUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  
  List<Map<String, String?>> mediaItems = [];

  void _addMedia() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        mediaItems.add({
          'CourseID': _courseIdController.text,
          'MediaType': _mediaTypeController.text,
          'MediaURL': _mediaUrlController.text,
          'Description': _descriptionController.text,
        });
        _courseIdController.clear();
        _mediaTypeController.clear();
        _mediaUrlController.clear();
        _descriptionController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.courseIDController,
                    decoration: const InputDecoration(
                      labelText: 'Course ID',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Course ID';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.mediaTypeController,
                    decoration: const InputDecoration(
                      labelText: 'Media Type',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Media Type';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.mediaURLController,
                    decoration: const InputDecoration(
                      labelText: 'Media URL',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Media URL';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.addMedia,
                    child: const Text('Add Media'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: mediaItems.length,
                itemBuilder: (context, index) {
                  final media = mediaItems[index];
                  return ListTile(
                    title: Text('Type: ${media['MediaType'] ?? 'N/A'}'),
                    subtitle: Text(
                      'Course ID: ${media['CourseID'] ?? 'N/A'}\n'
                      'URL: ${media['MediaURL'] ?? 'N/A'}\n'
                      'Description: ${media['Description'] ?? 'N/A'}',
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    tileColor: index.isEven ? Colors.grey.shade200 : Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
    final VideoPageControllerImg controller = Get.put(VideoPageControllerImg());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _courseIdController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  
  List<Map<String, String?>> videos = [];

  void _addVideo() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        videos.add({
          'CourseID': _courseIdController.text,
          'VideoURL': _videoUrlController.text,
          'Description': _descriptionController.text,
        });
        _courseIdController.clear();
        _videoUrlController.clear();
        _descriptionController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.courseIDController,
                    decoration: const InputDecoration(
                      labelText: 'Course ID',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Course ID';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.videoURLController,
                    decoration: const InputDecoration(
                      labelText: 'Video URL',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Video URL';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.addVideo,
                    child: const Text('Add Video'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return ListTile(
                    title: Text('Video URL: ${video['VideoURL'] ?? 'N/A'}'),
                    subtitle: Text(
                      'Course ID: ${video['CourseID'] ?? 'N/A'}\n'
                      'Description: ${video['Description'] ?? 'N/A'}',
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    tileColor: index.isEven ? Colors.grey.shade200 : Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
