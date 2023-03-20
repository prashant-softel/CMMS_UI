import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CustomMultiSelectDialogField extends StatefulWidget {
  List initialValue;
  List<MultiSelectItem<int?>> items;
  Function(dynamic selectedOptionsList) onConfirm;
  CustomMultiSelectDialogField(
      {super.key,
      required this.initialValue,
      required this.items,
      required this.onConfirm});

  @override
  State<CustomMultiSelectDialogField> createState() =>
      _CustomMultiSelectDialogFieldState();
}

class _CustomMultiSelectDialogFieldState
    extends State<CustomMultiSelectDialogField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: MultiSelectDialogField(
        initialValue: widget.initialValue,
        decoration: BoxDecoration(border: Border()),
        buttonIcon: Icon(Icons.arrow_drop_down),
        items: widget.items,
        onConfirm: widget.onConfirm,
        chipDisplay: MultiSelectChipDisplay(),
      ),
    );
  }
}
