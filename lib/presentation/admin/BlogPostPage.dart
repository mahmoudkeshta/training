import 'package:flutter/material.dart';

class BlogPostPage extends StatefulWidget {
  @override
  _BlogPostPageState createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bloggerNameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _paragraphTextController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  
  List<Map<String, String?>> blogPosts = [];

  void _addBlogPost() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        blogPosts.add({
          'Blogger Name': _bloggerNameController.text,
          'Title': _titleController.text,
          'Paragraph Text': _paragraphTextController.text,
          'Image URL': _imageUrlController.text,
        });
        _bloggerNameController.clear();
        _titleController.clear();
        _paragraphTextController.clear();
        _imageUrlController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Post Page'),
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
                    controller: _bloggerNameController,
                    decoration: const InputDecoration(
                      labelText: 'Blogger Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the Blogger Name';
                      }
                      return null;
                    },
                  ),
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
                    controller: _paragraphTextController,
                    decoration: const InputDecoration(
                      labelText: 'Paragraph Text',
                    ),
                    maxLines: 5,
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
                    onPressed: _addBlogPost,
                    child: const Text('Add Blog Post'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: blogPosts.length,
                itemBuilder: (context, index) {
                  final blogPost = blogPosts[index];
                  return ListTile(
                    title: Text(blogPost['Title'] ?? 'N/A'),
                    subtitle: Text(
                      'Blogger: ${blogPost['Blogger Name'] ?? 'N/A'}\n'
                      'Content: ${blogPost['Paragraph Text'] ?? 'N/A'}',
                    ),
                    leading: blogPost['Image URL'] != null
                        ? Image.network(
                            blogPost['Image URL']!,
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
