import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class ManufacturarTab extends StatelessWidget {
  const ManufacturarTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Dimens.boxHeight10,
          Text(
            'Manufacturing & Supplier Details',
            style: Styles.blackBold18,
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Manufacturer Name: *',
                ),
                CustomTextField(
                  label: 'Supplier Name: *',
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Model: *',
                ),
                CustomTextField(
                  label: 'Parent Equipment S No.: *',
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                CustomTextField(
                  label: 'Last Price: *',
                ),
                CustomTextField(
                  label: 'Currency: *',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
