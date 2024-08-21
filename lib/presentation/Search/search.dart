import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:training/core/app_export.dart';

class SearchDialog extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final SearchController _searchControllerGetX = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Search'),
      content: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Enter search term',
        ),
        onChanged: (value) {
  //_searchControllerGetX.updateSearchText(value);
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}