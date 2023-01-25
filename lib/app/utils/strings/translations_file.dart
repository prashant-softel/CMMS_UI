// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationsFile extends Translations {
  /// List of locales used in the application
  static const listOfLocales = <Locale>[
    Locale('en'),
  ];
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'hello': 'CMMS',
          'inventory': 'Inventory',
          'inventoryList': 'Inventory List',
          'retireAsset': 'Retire Asset',
          'exportAsset': 'Export Asset',
          'importAsset': 'Import Asset',
          'addAsset': 'Add Asset',
          'assetName': 'Asset Name',
          'serialNo': 'Serial No',
          'parrentAsset': 'Parent Asset',
          'catergory': 'Category',
          'assetFacilityName': 'Asset Facility Name',
          'action': 'Action',
          'requirementRejected': 'Requirement Rejected',
          'requirementAccepted': 'Requirement Accepted',
          'listView': 'List View',
          'treeView': 'Tree View',
          'mapView': 'Map View',
          'columnVisibility': 'Column Visibility',
          'search': 'Search',
          'addInventory': 'Add Inventory',
        },
      };
}
