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
          'requirementRejected': 'Requirement Rejected',
          'requirementAccepted': 'Requirement Accepted',
          'listView': 'List View',
          'treeView': 'Tree View',
          'mapView': 'Map View',
          'columnVisibility': 'Column Visibility',
          'search': 'Search',
          'addInventory': 'Add Inventory',
          'wcNo': 'WC No.',
          'dateOfClaim': 'Date of Claim',
          'country': 'Country',
          'plant': 'Plant',
          'claimTitle': 'Claim Title',
          'equipmentCategory': 'Equipment Category',
          'quantity': 'Quantity',
          'supplier': 'Supplier',
          'status': 'Status',
          'lastUpdatedDate': 'Last Updated Date',
          'closureDate': 'Closure Date',
          'materialReplacementStatus': 'Material Replacement Status',
          'estimatedCost': 'Estimated Cost',
          'all': 'All',
          'closed': 'Closed',
          'addWarrantyClaim': 'Add Warranty Claim',
          'warrantyClaimList': 'Warranty Claim List',
          'warranty': 'Warranty',
          'plantName': 'Plant Name',
          'assetName': 'Asset Name',
          'assetDescription': 'Asset Description',
          'serialNo': 'Serial No',
          'parentAsset': 'Parent Asset',
          'catergory': 'Category',
          'assetFacilityName': 'Asset Facility Name',
          'assetType': 'Asset Type',
          'assetStatus': 'Asset Status',
          'assetCustomerName': 'Asset Customer Name',
          'assetOwnerName': 'Asset Owner Name',
          'assetOperatorName': 'Asset Operator Name',
          'action': 'Action',
          'newWarrantyClaim': 'New Warranty Claim',
          'warrantyClaimTitle': 'Warranty Claim Title',
          'warrantyBriefDescription': 'Warranty Brief Description',
          'equipmentName': 'Equipment Name',
          'affectedParts': 'Affected Parts',
          'failureDate&Time': 'Failure Date & Time',
          'approximateDailyLoss': 'Approximate Daily Loss',
          'equipmentSrNo': 'Equipment Sr. No.',
          'manufacturersName': 'Manufacturers Name',
          'orderContractReferenceNumber': 'Order/Contract\nReference Number',
          'severity': 'Severity',
        },
      };
}
