import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color_values.dart';

class CustomSwitchTroggle extends GetView {
  Function(dynamic value)? onChanged;
  bool value;

  CustomSwitchTroggle({Key? key, this.onChanged, this.value = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.topCenter,
      scale: .7,
      child: Switch.adaptive(
          activeColor: ColorValues.appGreenColor,
          inactiveTrackColor: ColorValues.appRedColor,
          value: value,
          onChanged: onChanged),
    );
  }
}
