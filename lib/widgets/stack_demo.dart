import 'package:flutter/material.dart';
import 'widgets.dart';

/// Stack Widget Demo
/// Stack overlays widgets on top of each other
class StackDemo extends StatefulWidget {
  const StackDemo({super.key});

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  // State for Stack demo
  double _stackOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DemoPageTitle(text: 'Stack Widget Demo'),
          const SizedBox(height: 20),
          const DemoDescriptionText(
            text: 'Stack overlays widgets on top of each other:',
          ),
          const SizedBox(height: 30),
          // Stack example
          SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              // Alignment controls where children are positioned
              alignment: Alignment.center,
              children: [
                // Bottom layer - large blue box
                DemoColorBox(
                  label: '',
                  width: 180,
                  height: 180,
                  backgroundColor: Colors.blue.shade300,
                  borderRadius: 10,
                ),
                // Middle layer - medium green box
                Positioned(
                  top: _stackOffset,
                  left: 20 + _stackOffset,
                  child: DemoColorBox(
                    label: '',
                    width: 140,
                    height: 140,
                    backgroundColor: Colors.green.shade300,
                    borderRadius: 10,
                  ),
                ),
                // Top layer - small red box
                Positioned(
                  top: 40 + _stackOffset * 2,
                  left: 40 + _stackOffset * 2,
                  child: DemoColorBox(
                    label: 'Top',
                    width: 100,
                    height: 100,
                    backgroundColor: Colors.red.shade300,
                    borderRadius: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const DemoDescriptionText(
            text: 'Use the slider to see how Positioned works:',
            fontSize: 14,
          ),
          const SizedBox(height: 10),
          Slider(
            value: _stackOffset,
            min: 0,
            max: 30,
            onChanged: (value) {
              setState(() {
                _stackOffset = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const DemoHintText(
            text:
                'Stack is useful for overlaying widgets like badges, buttons, or images',
          ),
        ],
      ),
    );
  }
}
