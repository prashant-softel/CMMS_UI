import 'package:flutter/material.dart';

import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../utils/responsive.dart';

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
                    '$title:',
                    style: (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
                        ? Styles.appDarkGrey10
                        : Styles.appDarkGrey12,
                  ),
                  Wrap(children: [
                    for (var value in values ?? [])
                      Text(
                        ((values.length > 1) ? ' ' : '') + value,
                        style: (Responsive.isMobile(context) ||
                                Responsive.isTablet(context))
                            ? Styles.appDarkBlue12
                            : Styles.appDarkBlue15,
                      ),
                  ]),
                  Dimens.boxHeight20,
                  Dimens.boxHeight10,
                ]),
            // Dimens.boxHeight10,
          ),
        ]);
  }
}
