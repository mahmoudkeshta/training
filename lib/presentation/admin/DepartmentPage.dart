import 'package:flutter/material.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _headController = TextEditingController();
  List<Map<String, String>> departments = [];

  void _addDepartment() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        departments.add({
          'ID': _idController.text,
          'Name': _nameController.text,
          'Head': _headController.text,
        });
        _idController.clear();
        _nameController.clear();
        _headController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department'),
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
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                  ),
                
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addDepartment,
                    child: const Text('Add Department'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: departments.length,
                itemBuilder: (context, index) {
                  final department = departments[index];
                  return ListTile(
                    title: Text(department['Name']!),
                    subtitle: Text('ID: ${department['ID']} - Head: ${department['Head']}'),
                    leading: const Icon(Icons.work),
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
