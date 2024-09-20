import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class CustomMultiDropdown extends StatefulWidget {
  final List<Object>? initialValue;
  final List<DropdownItem<Object>>? items;
  String? title;
  final String? buttonText;
  final Function(List<Object>) onConfirm;
  double? height;

  CustomMultiDropdown({
    this.initialValue,
    this.items,
    this.title,
    this.buttonText,
    required this.onConfirm,
    this.height,
  });

  @override
  _CustomMultiDropdownState createState() => _CustomMultiDropdownState();
}

class _CustomMultiDropdownState extends State<CustomMultiDropdown> {
  late MultiSelectController<Object> _controller;
  late ValueNotifier<String> _hintTextNotifier;
  List<Object> selectedValues = [];
  bool isSelectAll = false;
  Object? currentClickedItem;

  @override
  void initState() {
    super.initState();
    _controller = MultiSelectController<Object>();
    _hintTextNotifier = ValueNotifier<String>(
      widget.title ?? 'Select options',
    );

    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      _controller
          .selectWhere((item) => widget.initialValue!.contains(item.value));
      selectedValues = widget.initialValue!;
      _updateHintText();
    }
  }

  void _updateHintText() {
    final selectedCount = [
      ...[...selectedValues]..remove('select_all')
    ].length;
    final itemCount = widget.items?.length ?? 0;

    if (selectedCount > 2) {
      _hintTextNotifier.value = "$selectedCount of $itemCount selected";
    } else if (selectedCount == 0) {
      _hintTextNotifier.value = widget.title ?? 'Please Select';
    } else {
      final selectedLabels = selectedValues.map((value) {
        final item = widget.items?.firstWhere(
          (element) => element.value == value,
          orElse: () => DropdownItem(value: value, label: 'Unknown'),
        );
        return item?.label ?? 'Unknown';
      }).join(', ');

      _hintTextNotifier.value = selectedLabels;
    }
  }

  void _handleSelectAll(bool selected) {
    List<Object> selectedValuesBuffer = [];
    setState(() {
      isSelectAll = selected;
      if (selected) {
        // Select all items

        selectedValuesBuffer =
            widget.items?.map((item) => item.value).toList() ?? [];
        selectedValues = ['select_all', ...selectedValuesBuffer];

        _updateHintText();
        widget.onConfirm(selectedValuesBuffer);
        _controller.selectAll();
      } else {
        // Deselect all items

        selectedValues.clear();

        _updateHintText();
        widget.onConfirm([]);
        _controller.clearAll();
      }
    });
  }

  void _onItemClicked(List<Object> newSelectedItems) {
    if (currentClickedItem == 'select_all') {
      if (isSelectAll) {
        // If `select_all` was clicked again, deselect everything
        _handleSelectAll(false);
      } else {
        // If `select_all` was clicked for the first time, select everything
        _handleSelectAll(true);
      }
    } else {
      // If any other option is clicked, deselect `select_all`
      if (isSelectAll) {
        setState(() {
          isSelectAll = false;
        });
      }
      setState(() {
        selectedValues = newSelectedItems;
        _updateHintText();
        List<Object> selectedValuesBuffer = [...selectedValues]
          ..remove('select_all');

        widget.onConfirm(selectedValuesBuffer);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Add "Select All" option at the top
    final List<DropdownItem<Object>> itemsWithSelectAll = [
      DropdownItem(value: 'select_all', label: 'Select All'),
      ...?widget.items,
    ];

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
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
      child: ValueListenableBuilder<String>(
        valueListenable: _hintTextNotifier,
        builder: (context, hintText, _) {
          return MultiDropdown<Object>(
            items: itemsWithSelectAll,
            controller: _controller,
            enabled: true,
            searchEnabled: true,
            selectedItemBuilder: (item) {
              return selectedValues.indexOf(item.value) == 0
                  ? Text(hintText)
                  : SizedBox(
                      width: 0,
                    );
            },
            chipDecoration: ChipDecoration(
              backgroundColor: Colors.transparent,
              wrap: false,
              runSpacing: 0,
              spacing: 0,
            ),
            fieldDecoration: FieldDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black87),
              showClearIcon: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.black87,
                ),
              ),
            ),
            dropdownDecoration: DropdownDecoration(
              marginTop: 2,
              maxHeight: 500,
              header: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Please Select',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            dropdownItemDecoration: DropdownItemDecoration(
              selectedIcon: const Icon(Icons.check_box, color: Colors.green),
              disabledIcon: Icon(Icons.lock, color: Colors.black12),
            ),
            onSelectionChange: (newSelectedItems) {
              // Get the currently clicked item
              if (newSelectedItems.length > selectedValues.length) {
                currentClickedItem = newSelectedItems
                    .firstWhere((item) => !selectedValues.contains(item));
              } else {
                currentClickedItem = selectedValues
                    .firstWhere((item) => !newSelectedItems.contains(item));
              }
              _onItemClicked(newSelectedItems);
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _hintTextNotifier.dispose();
    super.dispose();
  }
}
