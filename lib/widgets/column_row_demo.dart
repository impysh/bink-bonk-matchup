import 'package:flutter/material.dart';
import 'widgets.dart';

/// Column and Row Widget Demo
/// Column arranges widgets vertically, Row arranges widgets horizontally
class ColumnRowDemo extends StatelessWidget {
  const ColumnRowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DemoPageTitle(text: 'Column & Row Widgets Demo'),
          SizedBox(height: 30),

          // Column Section
          DemoSectionTitle(text: 'Column Widget - Vertical Layout'),
          SizedBox(height: 10),
          DemoDescriptionText(
            text: 'Column arranges widgets vertically (top to bottom):',
          ),
          SizedBox(height: 20),
          // Example boxes arranged vertically
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DemoColorBox(
                label: 'Box 1',
                backgroundColor: Colors.red,
              ),
              SizedBox(height: 10),
              DemoColorBox(
                label: 'Box 2',
                backgroundColor: Colors.green,
              ),
              SizedBox(height: 10),
              DemoColorBox(
                label: 'Box 3',
                backgroundColor: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 20),
          DemoHintText(
            text: 'These boxes are arranged in a Column',
          ),

          SizedBox(height: 50),

          // Row Section
          DemoSectionTitle(text: 'Row Widget - Horizontal Layout'),
          SizedBox(height: 10),
          DemoDescriptionText(
            text: 'Row arranges widgets horizontally (left to right):',
          ),
          SizedBox(height: 20),
          // Example boxes arranged horizontally
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DemoColorBox(
                label: '1',
                backgroundColor: Colors.purple,
                width: 80,
                height: 80,
                fontSize: 20,
              ),
              SizedBox(width: 10),
              DemoColorBox(
                label: '2',
                backgroundColor: Colors.orange,
                width: 80,
                height: 80,
                fontSize: 20,
              ),
              SizedBox(width: 10),
              DemoColorBox(
                label: '3',
                backgroundColor: Colors.teal,
                width: 80,
                height: 80,
                fontSize: 20,
              ),
            ],
          ),
          SizedBox(height: 20),
          DemoHintText(
            text: 'These boxes are arranged in a Row',
          ),

          SizedBox(height: 40),

          // Nested example: Row inside Column
          DemoSectionTitle(text: 'Nested Layout Example:'),
          SizedBox(height: 10),
          DemoDescriptionText(
            text: 'Row containing Columns (combining both widgets):',
            fontSize: 14,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  DemoColorBox(
                    label: '',
                    backgroundColor: Colors.red,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(height: 5),
                  Text('Red'),
                ],
              ),
              Column(
                children: [
                  DemoColorBox(
                    label: '',
                    backgroundColor: Colors.green,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(height: 5),
                  Text('Green'),
                ],
              ),
              Column(
                children: [
                  DemoColorBox(
                    label: '',
                    backgroundColor: Colors.blue,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(height: 5),
                  Text('Blue'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          DemoHintText(
            text: 'Key: Column = Vertical, Row = Horizontal',
          ),
        ],
      ),
    );
  }
}
