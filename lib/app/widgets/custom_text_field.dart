import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    // Key? key,
    this.label,
    this.maxLine = 1,
    this.width,
    this.textController,
    this.readOnly = false,
    this.onTap,
    this.errorText,
    this.numberTextField = false,
  });

  final String? label;
  final int? maxLine;
  final double? width;
  final bool readOnly;
  final Function()? onTap;
  final TextEditingController? textController;
  final String? errorText;
  final bool numberTextField;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimens.edgeInsets16,
      constraints: BoxConstraints(
        maxWidth: width ?? 420,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
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
                    inputFormatters: numberTextField
                        ? [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}'))
                          ]
                        : null,
                  ),
                  if (errorText != null)
                    Text(
                      errorText ?? 'Error text',
                      style: Styles.red12.copyWith(color: ColorsValue.redColor),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
