import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_value.dart';
import '../../utils/responsive.dart';
import 'mobile/card_widget.dart';

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
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
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
                //height: double.maxFinite,
                child: ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.jobList?.length,
                    itemBuilder: (context, index) {
                      final jobModel = controller.jobList?[index];
                      return GestureDetector(
                        onTap: () =>
                            controller.showJobDetails(jobModel?.id ?? 0),
                        child: SizedBox(
                          width: double.infinity,
                          child: CardWidget(jobModel: jobModel),
                        ),
                      );
                    }),
              ),

            // if (Responsive.isDesktop(context))
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: controller.jobList?.value.length,
            //     itemBuilder: (context, index) {
            //       final jobModel = controller.jobList?.value[index];
            //       return //
            //           CardWidget(jobModel: jobModel);
            //     }),
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
