import 'package:flutter/material.dart';

import '../../../theme/colors_value.dart';

class MultiValueWidget extends StatelessWidget {
  const MultiValueWidget({
    super.key,
    this.equipmentCategory,
  });

  final equipmentCategory;

  @override
  Widget build(BuildContext context) {
    return Chip(
      elevation: 20,
      padding: EdgeInsets.all(8),
      backgroundColor: ColorsValue.lightBlueColor,
      shadowColor: Colors.black,
      label: Text(
        equipmentCategory.equipmentCatName,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
