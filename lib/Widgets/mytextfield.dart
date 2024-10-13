
import 'package:flutter/material.dart';

// Custom widget that takes an Icon as a parameter
class SearchTextField extends StatelessWidget {
  final Icon icon; // Icon parameter
  final String hintText; // Hint text for the TextField
  final ValueChanged<String> onSubmitted; // Callback for when text is submitted

  const SearchTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search, // Shows "Search" button on the keyboard
      decoration: InputDecoration(
        prefixIcon: icon, // Use the icon parameter as the prefix icon
        hintText: hintText, // Hint text for the TextField
        border: OutlineInputBorder(),
      ),
      onSubmitted: onSubmitted, // Call the onSubmitted callback when user submits text
    );
  }
}