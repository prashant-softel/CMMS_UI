import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.edgeInsets16_0_16_0,
      color: Colors.grey.withOpacity(.2),
      height: Dimens.fiftyFive,
      child: Row(
        children: [
          Container(
            child: Text('inventoryList'.tr),
          ),
          Spacer(),
          ActionButton(
            icon: Icons.close,
            lable: 'retireAsset'.tr,
            onPress: () {},
            color: Colors.red,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.download,
            lable: 'exportAsset'.tr,
            onPress: () {},
            color: Colors.blue,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.upload,
            lable: 'importAsset'.tr,
            onPress: () {},
            color: Colors.blue,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.add,
            lable: 'addAsset'.tr,
            onPress: () {},
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
