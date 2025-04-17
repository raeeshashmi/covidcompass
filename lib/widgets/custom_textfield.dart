import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final void Function(String) onChanged;
  final TextEditingController controller;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search country by name',
        ),
      ),
    );
  }
}
