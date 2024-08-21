import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  
  List<Map<String, String?>> records = [];

  void _addRecord() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        records.add({
          'Title': _titleController.text,
          'Description': _descriptionController.text,
          'Start Date': _startDateController.text,
          'End Date': _endDateController.text,
          'Image URL': _imageUrlController.text,
        });
        _titleController.clear();
        _descriptionController.clear();
        _startDateController.clear();
        _endDateController.clear();
        _imageUrlController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record Page'),
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
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    maxLines: 3,
                  ),
                  TextFormField(
                    controller: _startDateController,
                    decoration: const InputDecoration(
                      labelText: 'Start Date (YYYY-MM-DD)',
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      // Add date validation if needed
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _endDateController,
                    decoration: const InputDecoration(
                      labelText: 'End Date (YYYY-MM-DD)',
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      // Add date validation if needed
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _imageUrlController,
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an Image URL';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addRecord,
                    child: const Text('Add Record'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  final record = records[index];
                  return ListTile(
                    title: Text(record['Title'] ?? 'N/A'),
                    subtitle: Text(
                      'Start Date: ${record['Start Date'] ?? 'N/A'}\n'
                      'End Date: ${record['End Date'] ?? 'N/A'}\n'
                      'Description: ${record['Description'] ?? 'N/A'}',
                    ),
                    leading: record['Image URL'] != null
                        ? Image.network(
                            record['Image URL']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : null,
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
