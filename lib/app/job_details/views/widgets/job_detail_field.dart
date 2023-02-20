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
                  if (title == "Current Status") ...[
                    Container(
                      padding: Dimens.edgeInsets05_0_5_0,
                      color: (value.toLowerCase() == "created")
                          ? Color(0xff58c3ca)
                          : (value.toLowerCase() == "assigned")
                              ? Color(0xff58c352)
                              : (value.toLowerCase() == "linked")
                                  ? Color(0xff787099)
                                  : (value.toLowerCase() == "in progress")
                                      ? Color(0xffbf8c4b)
                                      : (value.toLowerCase() == "closed")
                                          ? Color(0xff3438cd)
                                          : (value.toLowerCase() == "cancelled")
                                              ? Color(0xffbf4844)
                                              : Colors.transparent,
                      child: Text(
                        value,
                        style: Styles.navyBlue12,
                      ),
                    ),
                  ] else ...[
                    Text(
                      value,
                      style: Styles.navyBlue12,
                    ),
                  ],
                  Dimens.boxHeight10,
                ]),
          ),
        ]);
  }
}
