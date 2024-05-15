import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CustomMultiSelectDialogField extends StatefulWidget {
  final List<dynamic>? initialValue;
  final List<MultiSelectItem>? items;
  final String? title;
  final String? buttonText;
  final Function(dynamic selectedOptionsList) onConfirm;

  CustomMultiSelectDialogField({
    this.initialValue,
    this.items,
    this.title,
    this.buttonText,
    required this.onConfirm,
  });

  @override
  _CustomMultiSelectDialogFieldState createState() =>
      _CustomMultiSelectDialogFieldState();
}

class _CustomMultiSelectDialogFieldState
    extends State<CustomMultiSelectDialogField> {
  late List<dynamic> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initialValue ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _firstController = ScrollController();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 206, 205, 205).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: widget.initialValue == []
                ? Responsive.isMobile(context) || Responsive.isTablet(context)
                    ? Text(
                        widget.title!,
                        style: Styles.black13,
                      )
                    : Text(widget.title!)
                : SizedBox(
                    height: 40,
                    child: Scrollbar(
                      thumbVisibility: true,
                      controller: _firstController,
                      child: ListView.builder(
                        controller: _firstController,
                        itemCount: _selectedItems.length,
                        itemBuilder: (context, index) {
                          final item = _selectedItems[index];
                          return Chip(
                            label: Text(widget.items!
                                .firstWhere((element) => element.value == item)
                                .label), // Displaying the name of the selected item
                            deleteIcon: Icon(Icons.cancel),
                            onDeleted: () {
                              setState(() {
                                _selectedItems.remove(item);
                              });
                              widget.onConfirm(_selectedItems);
                            },
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () async {
                final selectedItems = await Get.dialog(
                  MultiSelectDialog(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.height * 0.3,
                    searchable: true,
                    items: widget.items!,
                    initialValue: _selectedItems,
                  ),
                );
                if (selectedItems != null) {
                  setState(() {
                    _selectedItems = selectedItems.cast<dynamic>().toList();
                  });
                  widget.onConfirm(_selectedItems);
                }
              },
            ),
          ),
          // SizedBox(
          //   height: _selectedItems.isNotEmpty ? 60 : 0,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 4),
          //     child: Scrollbar(
          //       thumbVisibility: true,
          //       controller: _firstController,
          //       child: ListView.builder(
          //         controller: _firstController,
          //         itemCount: _selectedItems.length,
          //         itemBuilder: (context, index) {
          //           final item = _selectedItems[index];
          //           return Chip(
          //             label: Text(widget.items!
          //                 .firstWhere((element) => element.value == item)
          //                 .label), // Displaying the name of the selected item
          //             deleteIcon: Icon(Icons.cancel),
          //             onDeleted: () {
          //               setState(() {
          //                 _selectedItems.remove(item);
          //               });
          //               widget.onConfirm(_selectedItems);
          //             },
          //           );
          //         },
          //         scrollDirection: Axis.horizontal,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
