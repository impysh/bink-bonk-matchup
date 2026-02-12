import 'package:flutter/material.dart';
import 'widgets.dart';

/// Visibility and ScrollView Widget Demo
/// Visibility shows/hides widgets, ScrollView enables scrolling
class VisibilityScrollViewDemo extends StatefulWidget {
  const VisibilityScrollViewDemo({super.key});

  @override
  State<VisibilityScrollViewDemo> createState() =>
      _VisibilityScrollViewDemoState();
}

class _VisibilityScrollViewDemoState extends State<VisibilityScrollViewDemo> {
  // State for Visibility demo
  bool _isVisible = true;

  // List of items for ScrollView demo
  final List<String> _scrollItems = List.generate(
    20,
    (index) => 'Item ${index + 1}',
  );

  void _showItemDetails({
    required BuildContext context,
    required String title,
    int? index,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index != null) ...[
                Text(
                  'Selected: item #$index',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 12),
                Text(
                  'Details (placeholder):\n'
                  'This is where you could show more information about item #$index.\n\n',
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DemoPageTitle(text: 'Visibility & ScrollView Widgets Demo'),
          const SizedBox(height: 40),

          // Visibility Section
          const DemoSectionTitle(text: 'Visibility Widget'),
          const SizedBox(height: 10),
          const DemoDescriptionText(
            text: 'Visibility widget shows or hides its child:',
          ),
          const SizedBox(height: 20),

          // Toggle button
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible; // Toggle visibility
              });
            },
            child: Text(_isVisible ? 'Hide Box' : 'Show Box'),
          ),

          const SizedBox(height: 20),

          // Visible/Invisible box
          Visibility(
            visible: _isVisible, // Controls visibility
            child: const DemoColorBox(
              label: 'I am visible!',
              backgroundColor: Colors.blue,
              width: 200,
              height: 100,
              fontSize: 18,
              borderRadius: 10,
            ),
          ),

          const SizedBox(height: 10),
          DemoHintText(
            text: _isVisible ? 'Status: Visible' : 'Status: Hidden',
            color: _isVisible ? Colors.green : Colors.red,
          ),

          const SizedBox(height: 40),

          // ScrollView Section
          const DemoSectionTitle(text: 'ScrollView Widget'),
          const SizedBox(height: 10),
          const DemoDescriptionText(
            text: 'ScrollView enables scrolling when content exceeds screen:',
          ),
          const SizedBox(height: 20),

          // Container with fixed height containing scrollable content
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _scrollItems.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      _showItemDetails(
                        context: context,
                        title: _scrollItems[index],
                        index: index + 1,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: Colors.blue[700],
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _scrollItems[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Icon(Icons.open_in_new,
                              size: 18, color: Colors.blue[700]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),
          const DemoHintText(text: 'Scroll up and down to see all items!'),

          const SizedBox(height: 30),

          // Additional ScrollView example - SingleChildScrollView
          const DemoSectionTitle(text: 'SingleChildScrollView Example:'),
          const SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: List.generate(
                  10,
                  (index) {
                    final title = 'Scrollable Item ${index + 1}';
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          _showItemDetails(
                            context: context,
                            title: title,
                            index: index + 1,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                              Icon(
                                Icons.info_outline,
                                size: 18,
                                color: Colors.green[800],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          const DemoHintText(
            text: 'Key: Visibility = Show/Hide, ScrollView = Scrollable Content',
          ),
        ],
      ),
    );
  }
}
