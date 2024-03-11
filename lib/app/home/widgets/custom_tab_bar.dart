import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    this.icon,
    required this.label,
  }) : super(key: key);

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 240,
      child: Row(
        children: [
          Icon(icon),
          Text(label),
        ],
      ),
    );
  }
}
