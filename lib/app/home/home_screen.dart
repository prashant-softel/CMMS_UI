import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('${'hello'.tr}'),
        ),
        drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? HomeDrawer()
            : null,
        body: Row(
          children: [
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens.box0
                : HomeDrawer(),
            Expanded(
              child: Center(
                child: Container(
                  margin: Dimens.edgeInsets16,
                  height: Get.height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: InventoryModule(),
                ),
              ),
            ),
          ],
        ),
      );
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Inventory {
  /// Creates the employee class with required details.
  Inventory({
    required this.asset,
    required this.name,
    required this.serialNo,
    required this.parentAsset,
    required this.category,
  });

  final String name;

  final String serialNo;
  final String parentAsset;
  final String category;
  final AssetName asset;
}

class AssetName {
  final String name;
  final int requirementStatus;

  AssetName(this.name, this.requirementStatus);
}
