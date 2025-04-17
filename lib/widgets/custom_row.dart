import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String text1;
  final int? text2;
  const CustomRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0125),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text1),
              Text(text2.toString()),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
