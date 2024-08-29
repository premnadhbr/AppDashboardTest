import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool showTextFiled;
  final ValueChanged<bool> onVisibilityChanged;

  const CustomTextField({
    Key? key,
    required this.showTextFiled,
    required this.onVisibilityChanged,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey, // Adjust icon color
        ),
        filled: true,
        fillColor: const Color.fromRGBO(48, 48, 48, 1.0),
        hintText: "Search...",
        hintStyle: const TextStyle(
          color: Colors.grey, // Adjust hint text color
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border side
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border side
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border side
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            widget.onVisibilityChanged(!widget.showTextFiled);
          },
          child: Container(
            margin: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: const Icon(Icons.close),
          ),
        ),
      ),
    );
  }
}
