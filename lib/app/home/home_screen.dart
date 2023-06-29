import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../inventory_list/views/inventory_list_screen.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return
        //
        Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Home'),
              centerTitle: true,
              elevation: 0,
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
              Expanded(
                child: Column(
                  children: [
                    // if (Responsive.isMobile(context) ||
                    //     Responsive.isTablet(context))
                    //   Expanded(
                    //     child: PreventiveChecklistListContentMobile(),
                    //   ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Data Coming Soon......")),
                      )
                  ],
                ),
              ),
            ],
          )),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 70,
            child: Text(
              'Drop Files Here',
              style: Styles.white13,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 227, 224, 224),
                  width: 1,
                ),
              ),
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
                    minWidth: Get.width * 0.12,
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
    this.suffixIcon,
    this.hintText,
    this.decoration,
    this.alignment,
    this.numberTextField = false,
  }) : super(key: key);

  final String? label;
  final int? maxLine;
  final double? width;
  final bool readOnly;
  final Icon? suffixIcon;
  final String? hintText;
  final Function()? onTap;
  final InputDecoration? decoration;
  final Alignment? alignment;
  final bool numberTextField;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: Dimens.edgeInsets16,
      constraints: BoxConstraints(
        maxWidth: width ?? 400,
        minWidth: 100,
      ),
      child: Row(
        children: [
          Container(
            width: 170,
            child: SizedBox(width: 50, child: Text('$label')),
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
                  filled: true,
                  fillColor: readOnly == true
                      ? Color.fromARGB(255, 206, 205, 205)
                      : Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(),
                  suffixIcon: suffixIcon,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                inputFormatters: numberTextField
                    ? [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                      ]
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFieldForStock extends StatelessWidget {
  const CustomTextFieldForStock({
    Key? key,
    this.label,
    this.maxLine = 1,
    this.width,
    this.textController,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.decoration,
    this.alignment,
    this.numberTextField = false,
  }) : super(key: key);

  final String? label;
  final int? maxLine;
  final double? width;
  final bool readOnly;
  final Icon? suffixIcon;
  final String? hintText;
  final Function()? onTap;
  final InputDecoration? decoration;
  final Alignment? alignment;
  final bool numberTextField;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: Dimens.edgeInsets5,
      constraints: BoxConstraints(
        maxWidth: width ?? 400,
        minWidth: 100,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextFormField(
                onTap: onTap,
                readOnly: readOnly,
                controller: textController,
                maxLines: maxLine,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.date_range),
                  contentPadding: Dimens.edgeInsets16_0_16_0,
                  filled: true,
                  fillColor: readOnly == true
                      ? Color.fromARGB(255, 206, 205, 205)
                      : Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                inputFormatters: numberTextField
                    ? [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                      ]
                    : null,
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
            width: 90,
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
