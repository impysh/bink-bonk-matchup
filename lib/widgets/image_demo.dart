import 'package:flutter/material.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'widgets.dart';

/// Image Widget Demo
/// Image widget displays images from various sources
class ImageDemo extends StatefulWidget {
  const ImageDemo({super.key});

  @override
  State<ImageDemo> createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  String? _selectedImagePath;

  Future<void> _pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) return;
      final path = result.files.single.path;
      if (path == null || path.isEmpty) return;

      setState(() {
        _selectedImagePath = path;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not pick image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            const DemoPageTitle(text: 'Image Widget Demo'),
            const SizedBox(height: 20),
            const DemoDescriptionText(
              text: 'Flutter can display images from various sources:',
            ),
            const SizedBox(height: 30),
            // Example 1: Network image
            const DemoInputLabel(text: 'Network Image (from URL):'),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://picsum.photos/200/150?random=1',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error, color: Colors.red),
                          SizedBox(height: 5),
                          Text('Failed to load image'),
                        ],
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Example 2: Asset image (commented out - requires assets in pubspec.yaml)
            const DemoInputLabel(text: 'Asset Image (from project assets):'),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 50, color: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      'Add image to assets folder\nand update pubspec.yaml',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Example 3: Icon as image placeholder
            const DemoInputLabel(text: 'Icon Widget (alternative to images):'),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 40),
                SizedBox(width: 20),
                Icon(Icons.star, color: Colors.amber, size: 40),
                SizedBox(width: 20),
                Icon(Icons.thumb_up, color: Colors.blue, size: 40),
              ],
            ),

            const SizedBox(height: 30),
            // New: Pick a file from the computer and display it
            const DemoInputLabel(text: 'File Image (upload from your computer):'),
            const SizedBox(height: 10),
            FilledButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.upload_file),
              label: Text(
                _selectedImagePath == null ? 'Choose image' : 'Choose another image',
              ),
            ),
            if (_selectedImagePath != null) ...[
              const SizedBox(height: 16),
              Container(
                width: 260,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(_selectedImagePath!),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error, color: Colors.red),
                            SizedBox(height: 5),
                            Text('Failed to load file image'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _selectedImagePath!,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            ],

            const SizedBox(height: 20),
            const DemoHintText(text: 'Image sources: Network, Asset, Memory, File'),
          ],
        ),
      ),
    );
  }
}
