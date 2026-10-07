import 'package:flutter/material.dart';

class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({super.key});

  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  final _formKey = GlobalKey<FormState>();

  String activity = '';
  String description = '';
  String category = 'Other';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Eco Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Record Your Eco Activity 🌱',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Activity Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Activity Name',
                  hintText: 'Example: Planted a tree',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.eco),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an activity';
                  }

                  return null;
                },
                onSaved: (value) {
                  activity = value!;
                },
              ),

              const SizedBox(height: 15),

              // Activity Category
              DropdownButtonFormField<String>(
                initialValue: category,
                decoration: const InputDecoration(
                  labelText: 'Activity Category',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Water',
                    child: Text('Water'),
                  ),
                  DropdownMenuItem(
                    value: 'Transport',
                    child: Text('Transport'),
                  ),
                  DropdownMenuItem(
                    value: 'Trees & Plants',
                    child: Text('Trees & Plants'),
                  ),
                  DropdownMenuItem(
                    value: 'Waste Management',
                    child: Text('Waste Management'),
                  ),
                  DropdownMenuItem(
                    value: 'Energy',
                    child: Text('Energy'),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text('Other'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    category = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              // Description
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Describe your eco-friendly activity',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }

                  return null;
                },
                onSaved: (value) {
                  description = value!;
                },
              ),

              const SizedBox(height: 20),

              // Add Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Navigator.pop(context, activity);
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Activity'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}