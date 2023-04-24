import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class DropFileWidget extends StatelessWidget {
  const DropFileWidget({
    Key? key,
    // required this.label,
    // required this.onPressed,
    // this.icon,
    // required this.color,
    // required Future<Null> Function() onPress,
  }) : super(key: key);
  // final String label;
  // final IconData? icon;
  // final Function() onPressed;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 160, 160, 160),
            radius: 70,
            child: Text(
              'Drop Files Here',
              style: Styles.white13,
            ),
          ),
        ],
      ),
    );
  }
}
