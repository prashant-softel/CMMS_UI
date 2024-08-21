import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/assigned_to_widget.dart';
import '../widgets/block_widget.dart';
import '../widgets/breakdown_time_widget.dart';
import '../widgets/equipment_categories_widget.dart';
import '../widgets/job_description_widget.dart';
import '../widgets/job_title_widget.dart';
import '../widgets/tools_required_widget.dart';
import '../widgets/update_job_button_widget.dart';
import '../widgets/work_area_widget.dart';
import '../widgets/work_type_widget.dart';

class EditJobContentMobile extends StatelessWidget {
  const EditJobContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

                /// Fault DropDown
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
                UpdateJobButtonWidget(),
              ],
            ),
          ),
        ),

        /// SELECT BLOCK DropDown

        ///
      ]),
    );
  }
}
