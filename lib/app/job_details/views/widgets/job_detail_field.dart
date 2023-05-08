import 'package:flutter/material.dart';
import '../../../../domain/models/job_model.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../utils/responsive.dart';

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
                    style: (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
                        ? Styles.appDarkGrey10
                        : Styles.appDarkGrey12,
                  ),
                  if (title == "Current Status") ...[
                    Container(
                      padding: Dimens.edgeInsets05_0_5_0,
                      color: JobStatusData.getStatusColor(value.toUpperCase()),
                      child: Text(
                        value,
                        style: (Responsive.isMobile(context) ||
                                Responsive.isTablet(context))
                            ? Styles.appDarkBlue12
                            : Styles.appDarkBlue15,
                      ),
                    ),
                  ] else ...[
                    Text(
                      value,
                      style: (Responsive.isMobile(context) ||
                              Responsive.isTablet(context))
                          ? Styles.appDarkBlue12
                          : Styles.appDarkBlue15,
                    ),
                  ],
                  Dimens.boxHeight10,
                ]),
          ),
        ]);
  }
}
