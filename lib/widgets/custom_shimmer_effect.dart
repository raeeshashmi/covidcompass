import 'package:covidtracker/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerEffect extends StatelessWidget {
  const CustomShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.grey.shade300,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CustomContainer(height: 50, width: 50),
            title: CustomContainer(),
            subtitle: CustomContainer(),
          );
        },
      ),
    );
  }
}
