import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _videoDemoController = TextEditingController();
  final TextEditingController _techController = TextEditingController();

  List<File> _projectImages = [];

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-0.2, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    _descController.dispose();
    _githubController.dispose();
    _videoDemoController.dispose();
    _techController.dispose();
    super.dispose();
  }
  //
  // Future<void> _pickImages() async {
  //   final ImagePicker picker = ImagePicker();
  //   final List<XFile>? pickedFiles = await picker.pickMultiImage();
  //
  //   if (pickedFiles != null && pickedFiles.isNotEmpty) {
  //     setState(() {
  //       _projectImages.addAll(pickedFiles.map((file) => File(file.path)));
  //     });
  //   }
  // }

  void _saveProject() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Project Added Successfully!")),
      );
      Navigator.pop(context);
    }
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Project Screenshots",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ..._projectImages.map((file) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  file,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              );
            }),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).cardColor,
                ),
                child: Icon(Icons.add_a_photo, size: 32,
                color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text("Add Project"),
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration:  InputDecoration(labelText: "Project Title",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                        validator: (value) =>
                        value == null || value.isEmpty ? "Enter project title" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _descController,
                        maxLines: 3,
                        decoration:  InputDecoration(labelText: "Description",
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                        validator: (value) =>
                        value == null || value.isEmpty ? "Enter description" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _githubController,
                        decoration:  InputDecoration(labelText: "GitHub Link",
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _videoDemoController,
                        decoration:  InputDecoration(labelText: "Video Demo Link",
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _techController,
                        decoration:  InputDecoration(labelText: "Technologies",
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildImagePicker(),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              child:  Text("Cancel",
                              style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _saveProject,
                              child: const Text("Save Project"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
