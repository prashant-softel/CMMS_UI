import 'package:flutter/material.dart';
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
            color: Color.fromARGB(255, 206, 205, 205).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: MultiSelectDialogField(
        searchable: true,
        title: Text('${widget.title}'),
        buttonText: Text('${widget.buttonText}'),
        initialValue: widget.initialValue!,
        decoration: BoxDecoration(border: Border()),
        buttonIcon: Icon(Icons.arrow_drop_down),
        items: widget.items!,
        onConfirm: widget.onConfirm,
        chipDisplay: CustomMultiSelectDisplay(
          onTap: (value) {
            // Handle chip removal
            // widget.onConfirm([...widget.initialValue!..remove(value)]);
          },
          icon: Icon(Icons.cancel), // Customize the icon as needed
          items: widget.items,
        ),
      ),
    );
  }
}

class CustomMultiSelectDisplay extends MultiSelectChipDisplay<dynamic> {
  final Icon? icon;
  final List<MultiSelectItem>? items;
  final Function(dynamic) onTap;

  CustomMultiSelectDisplay({
    required this.onTap,
    this.icon,
    this.items,
  }) : super(
          onTap: (value) {
            // Handle chip removal
            onTap([...items!..remove(value)]);
          },
          icon: icon,
        );
}
