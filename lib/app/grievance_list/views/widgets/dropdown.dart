import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) => DropdownButton<String>(
        items: <String>['A', 'B', 'C', 'D']
            .map(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        onChanged: (_) {},
      );
}
