import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/colors_value.dart';
import '../../utils/responsive.dart';
import 'mobile/card_widget.dart';
import 'web/table_view.dart';

class JobListScreen extends GetView<JobListController> {
  JobListScreen({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
        centerTitle: true,
      ),
      body: //
          Obx(
        () => //
            Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            //DateFilterWidget(),
            IconButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: controller.startDate.value,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2201),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        textTheme: const TextTheme(
                          bodyLarge: TextStyle(fontSize: 24.0),
                          bodyMedium: TextStyle(fontSize: 24.0),
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                ColorsValue.blueColor, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
              },
              icon: Icon(
                Icons.calendar_today,
                color: ColorsValue.navyBlueColor,
              ),
            ),

            /// DropDown
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                  color: Colors.lightBlue.shade50,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  value: controller.selectedFacility.value,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 9,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? selectedValue) {
                    controller.isFacilitySelected.value = true;
                    controller.selectedFacility.value = selectedValue ?? '';
                    controller.switchFacility(selectedValue);
                  },
                  items: controller.facilityList
                      .map<DropdownMenuItem<String>>((facility) {
                    return DropdownMenuItem<String>(
                      value: facility?.name ?? '',
                      child: Text(facility?.name ?? ''),
                    );
                  }).toList(),
                ),
              ),
            ),

            ///ListView
            if (Responsive.isMobile(context))
              Expanded(
                child: ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.jobList != null
                        ? controller.jobList?.length
                        : 0,
                    itemBuilder: (context, index) {
                      final jobModel = (controller.jobList != null)
                          ? controller.jobList![index]
                          : JobModel();
                      return GestureDetector(
                        onTap: () {
                          var _jobId = jobModel?.id ?? 0;
                          controller.showJobDetails(_jobId);
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: CardWidget(jobModel: jobModel),
                        ),
                      );
                    }),
              ),

            if (Responsive.isDesktop(context))
              Expanded(
                child: JobListScreenWeb(),
              ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addJob(),
        backgroundColor: ColorsValue.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorsValue.whiteColor,
        ),
      ),
    );
  }
}
