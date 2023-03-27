import 'package:cmms/app/add_job/views/widgets/assigned_to_widget.dart';
import 'package:cmms/app/add_job/views/widgets/block_widget.dart';
import 'package:cmms/app/add_job/views/widgets/breakdown_time_widget.dart';
import 'package:cmms/app/add_job/views/widgets/equipment_categories_widget.dart';
import 'package:cmms/app/add_job/views/widgets/job_description_widget.dart';
import 'package:cmms/app/add_job/views/widgets/job_title_widget.dart';
import 'package:cmms/app/add_job/views/widgets/tools_required_widget.dart';
import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/add_job/views/widgets/work_type_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/save_job_button_widget.dart';

class AddJobContentMobile extends StatelessWidget {
  const AddJobContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return //
        SingleChildScrollView(
      child: Column(
          ////
          children: [
            ///
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
            SaveJobButtonWidget(),

            ///
          ]),
    );
  }
}
