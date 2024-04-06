import 'package:cmms/app/add_job/views/widgets/assigned_to_widget.dart';
import 'package:cmms/app/add_job/views/widgets/block_widget.dart';
import 'package:cmms/app/add_job/views/widgets/breakdown_time_widget.dart';
import 'package:cmms/app/add_job/views/widgets/equipment_categories_widget.dart';
import 'package:cmms/app/add_job/views/widgets/job_description_widget.dart';
import 'package:cmms/app/add_job/views/widgets/job_title_widget.dart';
import 'package:cmms/app/add_job/views/widgets/tools_required_widget.dart';
import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/add_job/views/widgets/work_type_widget.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/save_job_button_widget.dart';

class AddJobContentMobile extends StatelessWidget {
  const AddJobContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return //
        SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Dimens.boxHeight10,
        HeaderWidgetMobile(),
        Dimens.boxHeight10,
        Container(
          margin: EdgeInsets.only(left: 30, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Job",
                style: Styles.blackBold18,
              ),
            ],
          ),
        ),
        Card(
          color: Colors.lightBlue.shade50,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                BlockWidget(),

                ///MULTISELECT CONTROL Equipment Categories
                EquipmentCategoriesWidget(),

                /// WORK AREA (= EQUIPMENTS) DropDown
                WorkAreaWidget(),

                /// Fault  DropDown
                WorkTypeWidget(),

                /// TOOLS REQUIRED DropDown
                ToolsRequiredWidget(),

                /// ASSIGNED To DropDown
                AssignedToWidget(),

                /// JOB TITLE
                JobTitleWidget(),

                /// JOB DESCRIPTION
                JobDescriptionWidget(),

                /// BREAKDOWN TIME
                BreakdownTimeWidget(),

                /// SAVE BUTTON
                SaveJobButtonWidget(),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
