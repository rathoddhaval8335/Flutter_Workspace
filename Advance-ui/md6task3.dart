import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedCategory;
  bool _agreeToContact = false;
  String _feedbackText = "";

  final List<String> _categories = [
    'App Performance',
    'Design & UI',
    'Features',
    'Other'
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Feedback Submitted"),
          content: Text(
            "Category: $_selectedCategory\n"
                "Contact Permission: $_agreeToContact\n"
                "Feedback: $_feedbackText",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Feedback Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select Category",
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory,
                items: _categories
                    .map((cat) =>
                    DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (value) {
                  setState(() => _selectedCategory = value);
                },
                validator: (value) =>
                value == null ? "Please select a category" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Enter your feedback",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty ? "Feedback cannot be empty" : null,
                onSaved: (value) => _feedbackText = value!,
              ),
              const SizedBox(height: 16),

              CheckboxListTile(
                title: const Text("I agree to be contacted for follow-up"),
                value: _agreeToContact,
                onChanged: (value) {
                  setState(() => _agreeToContact = value!);
                },
              ),
              const SizedBox(height: 16),
              
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Submit Feedback"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
