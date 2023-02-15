// import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  CustomDropdownWidget({
    required this.title,
    required this.dropdownTitle,
    required this.dropdownList,
    required this.dropDownValue,
    required this.onChangeDropdown,
    required this.errorText,
  });

  String? title;
  String? dropdownTitle;
  List<DropdownModel>? dropdownList;
  DropdownModel? dropDownValue;
  Function(DropdownModel?)? onChangeDropdown;
  String? errorText;

  @override
  Widget build(BuildContext context) => Container(
        margin: Dimens.edgeInsets16,
        constraints: BoxConstraints(
          maxWidth: 420,
          minWidth: 100,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Text(title ?? '-'),
            ),
            Dimens.boxWidth10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    // padding: Dimens.edgeInsets10_0_10_0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<DropdownModel>(
                        hint: Text(
                          dropdownTitle ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: dropdownList!
                            .map((item) => DropdownMenuItem<DropdownModel>(
                                  value: item,
                                  child: Text(
                                    item.name ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: dropDownValue,
                        onChanged: onChangeDropdown ?? (val) {},
                        buttonPadding: EdgeInsets.only(left: 8),
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        dropdownWidth: 200,
                        dropdownMaxHeight: 300,
                      ),
                    ),
                  ),
                  errorText != null
                      ? Text(
                          errorText ?? '',
                          style: Styles.red12
                              .copyWith(color: ColorsValue.redColor),
                        )
                      : Dimens.box0
                ],
              ),
            ),
          ],
        ),
      );
}
