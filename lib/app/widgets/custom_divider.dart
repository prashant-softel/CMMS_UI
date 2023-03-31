import 'package:flutter/material.dart';

import '../theme/color_values.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(color: ColorValues.greyLightColour, thickness: 1);
  }
}
