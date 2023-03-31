import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/job_details_model.dart';

class PTWCardWidget extends StatelessWidget {
  PTWCardWidget({Key? key, required this.associatedPermit}) : super(key: key);

  final AssociatedPermit? associatedPermit;

  @override
  Widget build(BuildContext context) =>

      //
      Container(
        child: Card(
          color: Color.fromARGB(255, 217, 225, 229),
          elevation: 10,
          shadowColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                //
                children: [
                  Row(
                      //
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Site Permit No.: ',
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${associatedPermit?.sitePermitNo ?? '0'}',
                          ),
                        ),
                      ]),
                  Row(//
                      children: [
                    Expanded(
                      child: Text(
                        'Permit Type: ',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${associatedPermit?.permitTypeName ?? ''}',
                        style: const TextStyle(
                          color: ColorValues.blackColor,
                        ),
                      ),
                    ),
                  ]),
                  Row(//
                      children: [
                    Expanded(
                      child: Text(
                        'Issued By: ',
                        style: const TextStyle(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        associatedPermit?.issuedByName ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                  Row(//
                      children: [
                    Expanded(
                      child: Text(
                        'Issued On: ',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        DateFormat('dd-MMM-yyyy hh:mm').format(
                            associatedPermit?.issueAt ?? DateTime.now()),
                      ),
                    ),
                  ]),
                  Row(
                      //
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Status: ',
                          ),
                        ),
                        Expanded(
                          child: Text(
                            associatedPermit?.ptwStatus.toString() ?? '',
                          ),
                        ),
                      ]),
                  Row(
                    children: [
                      ActionButton(
                        label: "Job Card",
                        icon: Icons.add,
                        onPressed: () {},
                        color: ColorValues.appPurpleColor,
                      )
                    ],
                  )
                ]),
          ),
        ),
      );

  ///
}
