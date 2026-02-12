import 'package:flutter/material.dart';
import 'widgets.dart';

/// GestureDetector Widget Demo
/// GestureDetector detects various user gestures
class GestureDetectorDemo extends StatefulWidget {
  const GestureDetectorDemo({super.key});

  @override
  State<GestureDetectorDemo> createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {
  // State for GestureDetector demo
  String _gestureStatus = 'Tap, long press, or drag me!';
  Color _gestureBoxColor = Colors.blue;
  final TextEditingController _nameController = TextEditingController();
  String _typedName = '';
  String _selectedCountry = 'India';
  bool _receiveUpdates = false;
  String _selectedLevel = 'Beginner';

  final List<String> _countryOptions = const <String>[
    'India',
    'USA',
    'Japan',
    'Germany',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DemoPageTitle(text: 'GestureDetector Widget Demo'),
          const SizedBox(height: 20),
          const DemoDescriptionText(
            text: 'Try different gestures on the box below:',
          ),
          const SizedBox(height: 40),
          // GestureDetector example
          GestureDetector(
            // Tap gesture (single tap)
            onTap: () {
              setState(() {
                _gestureStatus = 'Tapped!';
                _gestureBoxColor = Colors.green;
              });
            },
            // Double tap gesture
            onDoubleTap: () {
              setState(() {
                _gestureStatus = 'Double Tapped!';
                _gestureBoxColor = Colors.purple;
              });
            },
            // Long press gesture
            onLongPress: () {
              setState(() {
                _gestureStatus = 'Long Pressed!';
                _gestureBoxColor = Colors.orange;
              });
            },
            // Pan gesture (drag)
            onPanUpdate: (details) {
              setState(() {
                _gestureStatus = 'Dragging...';
                _gestureBoxColor = Colors.red;
              });
            },
            onPanEnd: (details) {
              setState(() {
                _gestureStatus = 'Drag ended';
                _gestureBoxColor = Colors.blue;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: DemoColorBox(
                label: 'Touch Me!',
                width: 200,
                height: 200,
                backgroundColor: _gestureBoxColor,
                borderRadius: 15,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 40),
          DemoStatusPanel(
            child: Text(
              _gestureStatus,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          const DemoHintText(
            text: 'Try: Tap, Double Tap, Long Press, or Drag',
          ),
          const SizedBox(height: 35),
          const DemoSectionTitle(text: 'Common Input Widgets'),
          const SizedBox(height: 10),
          const DemoDescriptionText(
            text:
                'These are basic user inputs: Text Field, Dropdown, Checkbox, and Radio Buttons.',
            fontSize: 14,
          ),
          const SizedBox(height: 20),
          const DemoInputLabel(text: 'Text Input'),
          const SizedBox(height: 8),
          DemoTextInput(
            controller: _nameController,
            labelText: 'Your name',
            hintText: 'Type your name here',
            onChanged: (value) {
              setState(() {
                _typedName = value;
              });
            },
          ),
          const SizedBox(height: 16),
          const DemoInputLabel(text: 'Dropdown'),
          const SizedBox(height: 8),
          DemoDropdownInput(
            labelText: 'Choose a country',
            value: _selectedCountry,
            options: _countryOptions,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _selectedCountry = value;
              });
            },
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Checkbox: Receive updates'),
            value: _receiveUpdates,
            onChanged: (value) {
              setState(() {
                _receiveUpdates = value ?? false;
              });
            },
          ),
          const SizedBox(height: 4),
          const DemoInputLabel(text: 'Radio Buttons: Experience Level'),
          RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            title: const Text('Beginner'),
            value: 'Beginner',
            groupValue: _selectedLevel,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _selectedLevel = value;
              });
            },
          ),
          RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            title: const Text('Intermediate'),
            value: 'Intermediate',
            groupValue: _selectedLevel,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _selectedLevel = value;
              });
            },
          ),
          RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            title: const Text('Advanced'),
            value: 'Advanced',
            groupValue: _selectedLevel,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _selectedLevel = value;
              });
            },
          ),
          const SizedBox(height: 16),
          DemoStatusPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Typed Name: ${_typedName.isEmpty ? '(empty)' : _typedName}'),
                Text('Selected Country: $_selectedCountry'),
                Text('Receive Updates: ${_receiveUpdates ? 'Yes' : 'No'}'),
                Text('Level: $_selectedLevel'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
