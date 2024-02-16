import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return
        //
        Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: Text('Home'),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
      body: Obx(() =>
      Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: controller.menuButton.value ? 250.0 : 70.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    (Responsive.isDesktop(context))
                        ? Expanded(child: DashBoardHomeWeb())
                        : Dimens.box0
                  ],
                ))
              ],
            ),
          ),
          Positioned(
            child: HomeDrawer(),
          ),
        ],
      ),
        ));
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
  CustomTextField({
    Key? key,
    this.label,
    this.maxLine = 1,
    this.width,
    this.textController,
    this.focusnode,
    this.scroll,
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
  FocusNode? focusnode;
  ScrollController? scroll;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.040,
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
                focusNode: focusnode,
                scrollController: scroll,
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
      height: MediaQuery.of(context).size.height * 0.043,
      // margin: Dimens.edgeInsets5,
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
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

class CustomTextFieldForPermit extends StatelessWidget {
  const CustomTextFieldForPermit({
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
      height: MediaQuery.of(context).size.height * 0.043,
      // margin: Dimens.edgeInsets5,
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
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
