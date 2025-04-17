import 'package:flutter/material.dart';

class CustomCountryTile extends StatelessWidget {
  final String? flag;
  final String? countryName;
  final int? cases;
  final void Function() onTap;
  const CustomCountryTile({
    super.key,
    required this.flag,
    required this.countryName,
    required this.cases,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.network(
        flag!,
        width: 50,
        height: 50,
      ),
      title: Text(countryName!),
      subtitle: Text(cases.toString()),
    );
  }
}
