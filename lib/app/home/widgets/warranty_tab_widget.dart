import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class WarrantyTab extends StatelessWidget {
  const WarrantyTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Dimens.boxHeight10,
          Text(
            'Warranty',
            style: Styles.blackBold18,
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Warranty Type: *',
                ),
                CustomTextField(
                  label: 'Warranty Provider: *',
                ),
              ],
            ),
          ),
          Row(
            children: [
              CustomTextField(
                label: 'Warranty Usages Term Type: *',
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Expire Date: *',
                ),
                CustomTextField(
                  label: 'Cirtificate Number: *',
                ),
              ],
            ),
          ),
          Row(
            children: [
              CustomTextField(
                label: 'Description: *',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
