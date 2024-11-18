import 'package:flutter/material.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Category Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the category
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ) 
    );
  }
}