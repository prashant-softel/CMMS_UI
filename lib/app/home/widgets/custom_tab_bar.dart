import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key? key, this.icon, required this.label, this.width, this.decoration})
      : super(key: key);

  final IconData? icon;
  final String label;
  final double? width;
  final Decoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(label),
        ],
      ),
    );
  }
}
