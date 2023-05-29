import 'package:flutter/material.dart';
import 'package:cmms/app/add_job/views/widgets/block_widget.dart';
import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:get/get.dart';

import '../../../theme/dimens.dart';
import '../../add_job_controller.dart';
import '../widgets/assigned_to_widget.dart';
import '../widgets/breakdown_time_widget.dart';
import '../widgets/equipment_categories_widget.dart';
import '../widgets/job_description_widget.dart';
import '../widgets/job_title_widget.dart';
import '../widgets/save_job_button_widget.dart';
import '../widgets/tools_required_widget.dart';
import '../widgets/work_type_widget.dart';

///
class AddJobContentWeb extends GetView<AddJobController> {
  AddJobContentWeb({super.key});

  ///
  FocusNode node1 = FocusNode();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        SingleChildScrollView(
      child: Column(//
          children: [
        FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Row(//
              children: [
            Expanded(
              child: //
                  Container(
                child: //

                    Column(
                        //
                        mainAxisSize: MainAxisSize.max,
                        children: [
                      /// SELECT BLOCK DropDown
                      FocusTraversalOrder(
                        order: NumericFocusOrder(1.0),
                        child: //
                            BlockWidget(),
                      ),

                      /// WORK AREA (= EQUIPMENTS) DropDown
                      FocusTraversalOrder(
                        order: NumericFocusOrder(2.0),
                        child: //
                            WorkAreaWidget(),
                      ),

                      /// TOOLS REQUIRED DropDown
                      FocusTraversalOrder(
                        order: NumericFocusOrder(5.0),
                        child: //
                            ToolsRequiredWidget(),
                      ),

                      /// JOB TITLE
                      FocusTraversalOrder(
                        order: NumericFocusOrder(7.0),
                        child: //
                            JobTitleWidget(),
                      ),

                      /// BREAKDOWN TIME
                      FocusTraversalOrder(
                        order: NumericFocusOrder(9.0),
                        child: BreakdownTimeWidget(),
                      ),
                    ]),
              ),
            ),
            //),
            Dimens.boxWidth30,
            Expanded(
              child: Container(
                child: Column(
                    //
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ///MULTISELECT CONTROL Equipment Categories
                      FocusTraversalOrder(
                        order: NumericFocusOrder(1.0),
                        child: EquipmentCategoriesWidget(),
                      ),

                      /// WORK TYPE  DropDown
                      FocusTraversalOrder(
                        order: NumericFocusOrder(4.0),
                        child: WorkTypeWidget(),
                      ),

                      /// ASSIGNED TO DropDown
                      FocusTraversalOrder(
                        order: NumericFocusOrder(8.0),
                        child: AssignedToWidget(),
                      ),

                      /// JOB DESCRIPTION
                      FocusTraversalOrder(
                        order: NumericFocusOrder(10.0),
                        child: JobDescriptionWidget(),
                      ),
                    ]),
              ),
            ),
          ]),
        ),

        /// SAVE BUTTON
        SaveJobButtonWidget(),
      ]),
    );
  }
}
