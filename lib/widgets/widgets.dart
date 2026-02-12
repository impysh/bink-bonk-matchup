import 'package:flutter/material.dart';

/// Big heading used at the top of each demo page.
class DemoPageTitle extends StatelessWidget {
  const DemoPageTitle({
    super.key,
    required this.text,
  });

  /// Main title text shown on a page.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Medium heading used to separate sections.
class DemoSectionTitle extends StatelessWidget {
  const DemoSectionTitle({
    super.key,
    required this.text,
  });

  /// Section title text.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Normal explanatory text for beginners.
class DemoDescriptionText extends StatelessWidget {
  const DemoDescriptionText({
    super.key,
    required this.text,
    this.center = true,
    this.fontSize = 16,
  });

  /// Description text.
  final String text;

  /// Whether to center-align the text.
  final bool center;

  /// Font size for the description.
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
      textAlign: center ? TextAlign.center : TextAlign.start,
    );
  }
}

/// Small italic helper text.
class DemoHintText extends StatelessWidget {
  const DemoHintText({
    super.key,
    required this.text,
    this.color,
  });

  /// Hint text.
  final String text;

  /// Optional text color.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Reusable colorful box used in many demos.
class DemoColorBox extends StatelessWidget {
  const DemoColorBox({
    super.key,
    required this.label,
    required this.backgroundColor,
    this.width = 100,
    this.height = 60,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.borderRadius = 0,
  });

  /// Text shown inside the box.
  final String label;

  /// Box background color.
  final Color backgroundColor;

  /// Box width.
  final double width;

  /// Box height.
  final double height;

  /// Label text color.
  final Color textColor;

  /// Label text size.
  final double fontSize;

  /// Corner roundness.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

/// Light rounded panel used to show state or results.
class DemoStatusPanel extends StatelessWidget {
  const DemoStatusPanel({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(15),
  });

  /// Content shown inside the panel.
  final Widget child;

  /// Panel background color.
  final Color? backgroundColor;

  /// Inner spacing around the child.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

/// Clear label shown above form controls.
class DemoInputLabel extends StatelessWidget {
  const DemoInputLabel({
    super.key,
    required this.text,
  });

  /// Label text.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// Beginner-friendly text field wrapper.
class DemoTextInput extends StatelessWidget {
  const DemoTextInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.onChanged,
  });

  /// Controls and reads the input text.
  final TextEditingController controller;

  /// Label shown inside the field.
  final String labelText;

  /// Hint shown when input is empty.
  final String hintText;

  /// Called whenever text changes.
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

/// Generic dropdown with a simple list of string options.
class DemoDropdownInput extends StatelessWidget {
  const DemoDropdownInput({
    super.key,
    required this.labelText,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  /// Label shown for the dropdown.
  final String labelText;

  /// Currently selected value.
  final String value;

  /// List of available options.
  final List<String> options;

  /// Called when selected value changes.
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      items: options
          .map(
            (option) => DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            ),
          )
          .toList(),
    );
  }
}

/// Reusable button used in bottom tab navigation.
class DemoBottomTabButton extends StatelessWidget {
  const DemoBottomTabButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  /// Text under the icon.
  final String label;

  /// Icon shown above the text.
  final IconData icon;

  /// Visual selected state.
  final bool isSelected;

  /// Called when the button is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[700],
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
