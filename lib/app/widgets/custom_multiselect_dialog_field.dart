import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CustomMultiSelectDialogField extends StatefulWidget {
  final List<dynamic>? initialValue;
  final List<MultiSelectItem>? items;
  final String? title;
  final String? buttonText;
  final Function(dynamic selectedOptionsList) onConfirm;
  double? height;
  CustomMultiSelectDialogField(
      {this.initialValue,
      this.items,
      this.title,
      this.buttonText,
      required this.onConfirm,
      this.height});

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
    final ScrollController _firstController =
        ScrollController(initialScrollOffset: 0.0);
    _firstController.addListener(() {
      if (_firstController.position.atEdge) {
        if (_firstController.position.pixels == 0) {
        } else {}
      }
    });

    // Sorting items alphabetically by label
    List<MultiSelectItem> sortedItems = widget.items!;
    sortedItems.sort((a, b) => a.label.compareTo(b.label)); // Sort by label

    return Container(
      height: 40,
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
          InkWell(
            onTap: () async {
              final selectedItems = await Get.dialog(
                MultiSelectDialog(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.height * 0.3,
                  searchable: true,
                  items: sortedItems, // Use sorted items
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
              height: widget.height == null ? 40 : widget.height,
              child: ListTile(
                title: widget.initialValue == []
                    ? Text(
                        widget.title!,
                        style: TextStyle(fontSize: 13),
                      )
                    : SizedBox(
                        height: 40,
                        child: Scrollbar(
                          thumbVisibility: false,
                          controller: _firstController,
                          child: ListView.builder(
                            controller: _firstController,
                            itemCount: _selectedItems.length,
                            itemBuilder: (context, index) {
                              final item = _selectedItems[index];
                              return Container(
                                child: Chip(
                                  label: Text(sortedItems
                                      .firstWhere(
                                          (element) => element.value == item)
                                      .label),
                                  deleteIcon: Icon(Icons.cancel),
                                  onDeleted: () {
                                    setState(() {
                                      _selectedItems.remove(item);
                                    });
                                    widget.onConfirm(_selectedItems);
                                  },
                                ),
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
                        items: sortedItems, // Use sorted items
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
            ),
          ),
        ],
      ),
    );
  }
}
