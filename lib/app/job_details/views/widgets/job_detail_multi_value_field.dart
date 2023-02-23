import 'package:flutter/material.dart';

import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';

class JobDetailMultiValueField extends StatelessWidget {
  const JobDetailMultiValueField({
    super.key,
    required this.title,
    required this.values,
  });

  ///
  final String title;
  final List<String> values;

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
                    title,
                    style: Styles.greyLight10,
                  ),
                  Wrap(children: [
                    for (var value in values ?? [])
                      Text(
                        ((values.length > 1) ? ' ' : '') + value,
                        style: Styles.navyBlue12,
                      ),
                  ]),
                  Dimens.boxHeight10,
                ]),
          ),
        ]);
  }
}
