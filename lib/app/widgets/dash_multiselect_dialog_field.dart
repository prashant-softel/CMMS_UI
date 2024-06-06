import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class DashCustomMultiSelectDialogField extends StatefulWidget {
  final List<dynamic>? initialValue;
  final List<MultiSelectItem>? items;
  final String? title;
  final String? buttonText;
  final Function(dynamic selectedOptionsList) onConfirm;

  DashCustomMultiSelectDialogField({
    this.initialValue,
    this.items,
    this.title,
    this.buttonText,
    required this.onConfirm,
  });

  @override
  _DashCustomMultiSelectDialogFieldState createState() =>
      _DashCustomMultiSelectDialogFieldState();
}

class _DashCustomMultiSelectDialogFieldState
    extends State<DashCustomMultiSelectDialogField> {
  late List<dynamic> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initialValue ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
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
              child: Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: _selectedItems.isEmpty
                      ? [
                          Text(
                            widget.title!,
                            style: TextStyle(fontSize: 12),
                          ),
                        ]
                      : [
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: _selectedItems.length,
                              itemBuilder: (context, index) {
                                final item = _selectedItems[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Chip(
                                    label: Text(
                                      widget.items!
                                          .firstWhere((element) =>
                                              element.value == item)
                                          .label,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    deleteIcon: Icon(
                                      Icons.cancel,
                                      size: 18,
                                    ),
                                    onDeleted: () {
                                      setState(() {
                                        _selectedItems.remove(item);
                                      });
                                      widget.onConfirm(_selectedItems);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                ),
              ),
            ),
          ),
          IconButton(
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
        ],
      ),
    );
  }
}
