import 'package:flutter/material.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';

class JobDetailField extends StatelessWidget {
  const JobDetailField({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
        //
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //
                children: [
                  Text(
                    '$title: ',
                    style: Styles.greyLight10,
                  ),
                  Text(
                    value,
                    style: Styles.navyBlue12,
                  ),
                  Dimens.boxHeight10,
                ]),
          ),
        ]);
  }
}
