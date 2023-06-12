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
    return //
        SingleChildScrollView(
      child: //
          Column(
              //
              children: [
            /// SELECT BLOCK DropDown
            BlockWidget(),

            ///MULTISELECT CONTROL Equipment Categories
            EquipmentCategoriesWidget(),

            /// WORK AREA (= EQUIPMENTS) DropDown
            WorkAreaWidget(),

            /// WORK TYPE  DropDown
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

            ///
          ]),
    );
  }
}
