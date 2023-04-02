import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:cmms/app/job_list/views/mobile/job_list_content_mobile.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/new_permit_list/mobile/new_permit_list_mobile.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/new_permit_list/web/new_permit_list_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../utils/responsive.dart';
// import 'web/job_list_content_web.dart';

class NewPermitListScreen extends GetView<NewPermitListController> {
  NewPermitListScreen({Key? key});

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      body:
          //   Obx(
          // () => //
          Container(
        child: Column(
            //
            children: [
              //DateFilterWidget(),
              // IconButton(
              //   onPressed: () async {
              //     final DateTime? picked = await showDatePicker(
              //       context: context,
              //       initialDate: controller.startDate.value,
              //       firstDate: DateTime(1900),
              //       lastDate: DateTime(2201),
              //       builder: (context, child) {
              //         return Theme(
              //           data: Theme.of(context).copyWith(
              //             textTheme: const TextTheme(
              //               bodyLarge: TextStyle(fontSize: 24.0),
              //               bodyMedium: TextStyle(fontSize: 24.0),
              //             ),
              //             textButtonTheme: TextButtonThemeData(
              //               style: TextButton.styleFrom(
              //                 foregroundColor:
              //                     ColorsValue.blueColor, // button text color
              //               ),
              //             ),
              //           ),
              //           child: child!,
              //         );
              //       },
              //     );
              //   },
              //   icon: Icon(
              //     Icons.calendar_today,
              //     color: ColorsValue.navyBlueColor,
              //   ),
              // ),

              ///ListView
              if (Responsive.isMobile(context))
                Expanded(
                  child: NewPermitListMobile(),
                ),

              if (Responsive.isDesktop(context))
                Expanded(
                  child: //
                       NewPermitListWeb(),
                      
                ),
            ]),
      ),
    );

    ///
  }
}
