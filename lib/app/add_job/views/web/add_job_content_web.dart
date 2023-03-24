import 'package:flutter/material.dart';
import 'package:cmms/app/add_job/views/widgets/assigned_to_widget.dart';
import 'package:cmms/app/add_job/views/widgets/block_widget.dart';
import 'package:cmms/app/add_job/views/widgets/breakdown_time_widget.dart';
import 'package:cmms/app/add_job/views/widgets/equipment_categories_widget.dart';
import 'package:cmms/app/add_job/views/widgets/job_description_widget.dart';
import 'package:cmms/app/add_job/views/widgets/job_title_widget.dart';
import 'package:cmms/app/add_job/views/widgets/tools_required_widget.dart';
import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/add_job/views/widgets/work_type_widget.dart';

import '../../../theme/dimens.dart';
import '../widgets/save_job_button_widget.dart';

///
class AddJobContentWeb extends StatelessWidget {
  const AddJobContentWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(//
          children: [
        Expanded(
          child: Container(
            //height: 1100,
            child: Column(
                //
                mainAxisSize: MainAxisSize.max,
                children: [
                  /// SELECT BLOCK DropDown
                  BlockWidget(),

                  /// WORK AREA (= EQUIPMENTS) DropDown
                  WorkAreaWidget(),

                  /// TOOLS REQUIRED DropDown
                  ToolsRequiredWidget(),

                  /// JOB TITLE
                  JobTitleWidget(),

                  /// BREAKDOWN TIME
                  BreakdownTimeWidget(),
                ]),
          ),
        ),
        Dimens.boxWidth30,
        Expanded(
          child: Container(
            //height: 1100,
            child: Column(
                //
                mainAxisSize: MainAxisSize.max,
                children: [
                  ///MULTISELECT CONTROL Equipment Categories
                  EquipmentCategoriesWidget(),

                  /// WORK TYPE  DropDown
                  WorkTypeWidget(),

                  /// ASSIGNED TO DropDown
                  AssignedToWidget(),

                  /// JOB DESCRIPTION
                  JobDescriptionWidget(),
                ]),
          ),
        ),
      ]),

      /// SAVE BUTTON
      SaveJobButtonWidget(),
    ]);
  }
}
