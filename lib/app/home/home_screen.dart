import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/preventive_maintanance/view/preventive_maintenance_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../inventory_list/views/inventory_list_screen.dart';
import '../job_list/views/job_list_screen.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return //
        Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 100,
            )
          : AppBar(
              title: HeaderWidget(),
              elevation: 0,
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
      body:
          ////
          Row(
              //
              children: [
            //
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                :
                //
                HomeDrawer(),

            Obx(
              () => //
                  Expanded(
                //flex: 8,
                child: Center(
                  child: Container(
                    margin: Dimens.edgeInsets16,
                    height: Get.height,
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.grey.withOpacity(.3)),
                    // ),
                    child: (() {
                      switch (controller.selectedIndex.value) {
                        case 1:
                          return InventoryListScreen();

                        case 2:
                          return JobListScreen();

                        case 3:
                          return InventoryListScreen();
                        case 4:
                          return PreventiveScreen();

                        default:
                          return InventoryListScreen();
                      }
                      // your code here
                    }()),
                  ),
                ),
              ),
            ),

            ///
          ]),
    );
  }
}

class Files extends StatelessWidget {
  const Files({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimens.edgeInsets16,
      child: Row(
        children: [
          CircleAvatar(
            radius: 70,
            child: Text(
              'Drop Files Here',
              style: Styles.white13,
            ),
          ),
          Expanded(
            child: ScrollableTableView(
              columns: [
                "#",
                "Name",
                "File Category",
                "Size",
                "Status",
                "Remove",
              ].map((column) {
                return TableViewColumn(
                  minWidth: 100,
                  label: column,
                );
              }).toList(),
              rows: [
                [
                  "1",
                  "Test.png",
                  "20.00",
                  "sdvf",
                  "sfv",
                  "remove",
                ],
                [
                  "1",
                  "Test.png",
                  "20.00",
                  "sdvf",
                  "sfv",
                  "remove",
                ],
              ].map((record) {
                return TableViewRow(
                  height: 60,
                  cells: record.map((value) {
                    if (value == 'remove')
                      return TableViewCell(
                        child: Icon(Icons.delete),
                      );
                    return TableViewCell(
                      child: Text(value),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ManufacturarTab extends StatelessWidget {
  const ManufacturarTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Dimens.boxHeight10,
          Text(
            'Manufacturing & Supplier Details',
            style: Styles.blackBold18,
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Manufacturer Name: *',
                ),
                CustomTextField(
                  label: 'Supplier Name: *',
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Model: *',
                ),
                CustomTextField(
                  label: 'Parent Equipment S No.: *',
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Last Price: *',
                ),
                CustomTextField(
                  label: 'Currency: *',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WarrantyTab extends StatelessWidget {
  const WarrantyTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Dimens.boxHeight10,
          Text(
            'Warranty',
            style: Styles.blackBold18,
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Warranty Type: *',
                ),
                CustomTextField(
                  label: 'Warranty Provider: *',
                ),
              ],
            ),
          ),
          Row(
            children: [
              CustomTextField(
                label: 'Warranty Usages Term Type: *',
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Expire Date: *',
                ),
                CustomTextField(
                  label: 'Cirtificate Number: *',
                ),
              ],
            ),
          ),
          Row(
            children: [
              CustomTextField(
                label: 'Description: *',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label,
    this.maxLine = 1,
    this.width,
    this.textController,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  final String? label;
  final int? maxLine;
  final double? width;
  final bool readOnly;
  final Function()? onTap;

  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimens.edgeInsets16,
      constraints: BoxConstraints(
        maxWidth: width ?? 400,
        minWidth: 100,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text('$label'),
          ),
          Dimens.boxWidth10,
          Expanded(
            child: Container(
              child: TextFormField(
                onTap: onTap,
                readOnly: readOnly,
                controller: textController,
                maxLines: maxLine,
                decoration: InputDecoration(
                  contentPadding: Dimens.edgeInsets16_0_16_0,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPhoto extends StatelessWidget {
  const AddPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(.3),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 90,
            width: 130,
            child: Icon(
              Icons.photo,
              size: 30,
            ),
          ),
          Container(
            height: 30,
            width: 130,
            margin: Dimens.edgeInsets2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
              color: Colors.black54,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                  size: 20,
                ),
                Dimens.boxWidth4,
                Text(
                  'Add Photos',
                  style: Styles.white12.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Inventory {
  /// Creates the employee class with required details.
  Inventory({
    required this.asset,
    required this.name,
    required this.serialNo,
    required this.parentAsset,
    required this.category,
  });

  final String name;

  final String serialNo;
  final String parentAsset;
  final String category;
  final AssetName asset;
}

class AssetName {
  final String name;
  final int requirementStatus;

  AssetName(this.name, this.requirementStatus);
}
