import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/master_dashboard/master_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onHover.dart';

// import '../../navigators/app_pages.dart';

class MastersDashboard extends GetView<MastersController> {
  MastersDashboard({super.key});

  final MastersController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: HeaderWidget(),
              elevation: 0,
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Row(
          children: [
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                :
                //
                HomeDrawer(),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isMobile(context))
                      Obx(
                        () => Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              shadowColor: ColorValues.greyColor,
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: controller.selectedFacility.value,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    elevation: 7,
                                    style: const TextStyle(color: Colors.black),
                                    onChanged: (String? selectedValue) {
                                      controller.isFacilitySelected.value =
                                          true;
                                      controller.selectedFacility.value =
                                          selectedValue ?? '';
                                    },
                                    items: controller.facilityList
                                        .map<DropdownMenuItem<String>>(
                                            (facility) {
                                      return DropdownMenuItem<String>(
                                        value: facility?.name ?? '',
                                        child: Text(facility?.name ?? ''),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (Responsive.isDesktop(context))
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Masters",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      // height: Get.height,
                      // margin: EdgeInsets.only(left: 20),
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          // Container(
                          //   margin: EdgeInsets.only(left: 20),
                          //   child: Text(
                          //     "Permit To Work",
                          //     style: TextStyle(
                          //         color: Color.fromARGB(255, 159, 156, 156),
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.w400),
                          //   ),
                          // ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 20),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "Permit To Work",
                          //         style: TextStyle(
                          //           color: Color.fromARGB(255, 159, 156, 156),
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //           width:
                          //               10), // Add some space between the text and the line
                          //       Expanded(
                          //         child: Divider(
                          //           color: Colors
                          //               .grey, // Customize the color of the line if needed
                          //           height:
                          //               1, // Adjust the height of the line if needed
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   primary: false,
                          //   padding: Dimens.edgeInsets15,
                          //   crossAxisSpacing: 6,
                          //   mainAxisSpacing: 6,
                          //   crossAxisCount:
                          //       Responsive.isMobile(context) ? 2 : 5,
                          //   childAspectRatio: Responsive.isMobile(context)
                          //       ? (itemWidth / itemHeight)
                          //       : (itemWidth / itemHeightWeb),
                          //   children: <Widget>[
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Permit Type",
                          //           onTap: () {
                          //             controller.goToPermitTypeScreen();
                          //           });
                          //     }))),
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: 'Safety Questions',
                          //           onTap: () {
                          //             controller.gotToSafetyQuestionsList();
                          //           });
                          //     }))),
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "TBT Type",
                          //           onTap: () {
                          //             controller.goToJobTypeList();
                          //           });
                          //     }))),
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "TBT SOP List",
                          //           onTap: () {
                          //             controller.goToJobSOPList();
                          //           });
                          //     }))),
                          //
                          //     // createContentTile(title: "Job Card List"),
                          //     // _priventiveList(tittle: "PM Schedule View"),
                          //     // _priventiveList(tittle: "PM Report"),
                          //     // _priventiveList(tittle: "PM Report"),
                          //     // _priventiveList(tittle: "PM "),
                          //   ],
                          // ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 20),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "Assets",
                          //         style: TextStyle(
                          //           color: Color.fromARGB(255, 159, 156, 156),
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //           width:
                          //               10), // Add some space between the text and the line
                          //       Expanded(
                          //         child: Divider(
                          //           color: Colors
                          //               .grey, // Customize the color of the line if needed
                          //           height:
                          //               1, // Adjust the height of the line if needed
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   primary: false,
                          //   padding: Dimens.edgeInsets15,
                          //   crossAxisSpacing: 6,
                          //   mainAxisSpacing: 6,
                          //   crossAxisCount:
                          //       Responsive.isMobile(context) ? 2 : 5,
                          //   childAspectRatio: Responsive.isMobile(context)
                          //       ? (itemWidth / itemHeight)
                          //       : (itemWidth / itemHeightWeb),
                          //   children: <Widget>[
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Asset Category List",
                          //           onTap: () {
                          //             controller.goToAssetTypeList();
                          //           });
                          //     }))),
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Asset Type List",
                          //           onTap: () {
                          //             controller.goToInventoryTypeList();
                          //           });
                          //     }))),
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Asset Status List",
                          //           onTap: () {
                          //             controller.goToInventoryStatusList();
                          //           });
                          //     }))),
                          //   ],
                          // ),
                          varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id == 5 && e.add == 0)
                                      .length >
                                  0
                              ? Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Facility",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 159, 156, 156),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Dimens.box0,
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: Dimens.edgeInsets15,
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              OnHover(builder: (((isHovered) {
                                return
                                    // varUserAccessModel.value.access_list!
                                    //             .where((e) =>
                                    //                 e.feature_id == 5 && e.add == 0)
                                    //             .length >
                                    //         0
                                    //     ?
                                    createContentTile(
                                        title: "SPV List",
                                        onTap: () {
                                          controller.goToSPVList();
                                        });
                                // : Dimens.box0;
                              }))),
                              OnHover(builder: (((isHovered) {
                                return
                                    //  varUserAccessModel.value.access_list!
                                    //             .where((e) =>
                                    //                 e.feature_id == 5 && e.add == 0)
                                    //             .length >
                                    //         0
                                    //     ?
                                    createContentTile(
                                        title: "Facility List",
                                        onTap: () {
                                          controller.goToFacilityTypeList();
                                        });
                                // : Dimens.box0;
                              }))),
                              OnHover(builder: (((isHovered) {
                                return
                                    //  varUserAccessModel.value.access_list!
                                    //             .where((e) =>
                                    //                 e.feature_id == 5 && e.add == 0)
                                    //             .length >
                                    //         0
                                    //     ?
                                    createContentTile(
                                        title: "Block List",
                                        onTap: () {
                                          controller.goToBlockTypeList();
                                        });
                                // : Dimens.box0;
                              }))),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Business ",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 156, 156),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Add some space between the text and the line
                                Expanded(
                                  child: Divider(
                                    color: Colors
                                        .grey, // Customize the color of the line if needed
                                    height:
                                        1, // Adjust the height of the line if needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: Dimens.edgeInsets15,
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Business Type List",
                                    onTap: () {
                                      controller.goToBusinessTypeList();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Business List",
                                    onTap: () {
                                      controller.goToBusinessList();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Business List Import",
                                    onTap: () {
                                      controller.goToImportBusiness();
                                    });
                              }))),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Module and Users",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 156, 156),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Add some space between the text and the line
                                Expanded(
                                  child: Divider(
                                    color: Colors
                                        .grey, // Customize the color of the line if needed
                                    height:
                                        1, // Adjust the height of the line if needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: Dimens.edgeInsets15,
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              OnHover(
                                builder: ((isHovered) {
                                  return createContentTile(
                                      title: "Modules List",
                                      onTap: () {
                                        controller.goToFeatureList();
                                      });
                                }),
                              ),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Roles",
                                    onTap: () {
                                      controller.goToRoleTypeList();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Role Access",
                                    onTap: () {
                                      controller.goToRoleAccess();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Role Notifications",
                                    onTap: () {
                                      controller.goToRoleNotification();
                                    });
                              }))),
                            ],
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: Dimens.edgeInsets15,
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "User List",
                                    onTap: () {
                                      controller.goToUserList();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Add User",
                                    onTap: () {
                                      controller.clearStoreUserIdData();

                                      controller.goToAddUser();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Import User",
                                    onTap: () {
                                      controller.goToImportUser();
                                    });
                              }))),
                              // OnHover(builder: (((isHovered) {
                              //   return createContentTile(
                              //       title: "Designation",
                              //       onTap: () {
                              //         controller.goToDesignationScreen();
                              //       });
                              // }))),
                              // OnHover(builder: (((isHovered) {
                              //   return createContentTile(
                              //       title: "Competencies",
                              //       onTap: () {
                              //         controller.goToCompetencyScreen();
                              //       });
                              // }))),
                              // OnHover(builder: (((isHovered) {
                              //   return createContentTile(
                              //       title: "Escalation Matrix",
                              //       onTap: () {
                              //         controller.goToEscalationMatrixScreen();
                              //       });
                              // }))),
                            ],
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: Dimens.edgeInsets15,
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Designation",
                                    onTap: () {
                                      controller.goToDesignationScreen();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Competencies",
                                    onTap: () {
                                      controller.goToCompetencyScreen();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Escalation Matrix",
                                    onTap: () {
                                      controller.goToEscalationMatrixScreen();
                                    });
                              }))),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "General ",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 156, 156),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Add some space between the text and the line
                                Expanded(
                                  child: Divider(
                                    color: Colors
                                        .grey, // Customize the color of the line if needed
                                    height:
                                        1, // Adjust the height of the line if needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: Dimens.edgeInsets15,
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Blood List",
                                    onTap: () {
                                      controller.goToBloodTypeList();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Country List",
                                    onTap: () {
                                      controller.goToCountryTypeList();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "State List",
                                    onTap: () {
                                      controller.goToStateTypeList();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "City List",
                                    onTap: () {
                                      controller.goToStateTypeList();
                                    });
                              }))),
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Frequency List",
                                    onTap: () {
                                      controller.goToFrequencyList();
                                    });
                              }))),
                            ],
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 20),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "Stock Management",
                          //         style: TextStyle(
                          //           color: Color.fromARGB(255, 159, 156, 156),
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //           width:
                          //               10), // Add some space between the text and the line
                          //       Expanded(
                          //         child: Divider(
                          //           color: Colors
                          //               .grey, // Customize the color of the line if needed
                          //           height:
                          //               1, // Adjust the height of the line if needed
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   primary: false,
                          //   padding: Dimens.edgeInsets15,
                          //   crossAxisSpacing: 6,
                          //   mainAxisSpacing: 6,
                          //   crossAxisCount:
                          //       Responsive.isMobile(context) ? 2 : 5,
                          //   childAspectRatio: Responsive.isMobile(context)
                          //       ? (itemWidth / itemHeight)
                          //       : (itemWidth / itemHeightWeb),
                          //   children: <Widget>[
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Asset Master",
                          //           onTap: () {
                          //             controller.goToAssetMasterList();
                          //           });
                          //     }))),
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Add Asset Master",
                          //           onTap: () {
                          //             controller.goToAddAssetMaster();
                          //           });
                          //     }))),
                          //     // OnHover(builder: (((isHovered) {
                          //     //   return createContentTile(
                          //     //       title: "Country List",
                          //     //       onTap: () {
                          //     //         controller.goToCountryTypeList();
                          //     //       });
                          //     // }))),
                          //     // OnHover(builder: (((isHovered) {
                          //     //   return createContentTile(
                          //     //       title: "State List",
                          //     //       onTap: () {
                          //     //         controller.goToStateTypeList();
                          //     //       });
                          //     // }))),
                          //     //
                          //     // OnHover(builder: (((isHovered) {
                          //     //   return createContentTile(
                          //     //       title: "Frequency List",
                          //     //       onTap: () {
                          //     //         controller.goToFrequencyList();
                          //     //       });
                          //     // }))),
                          //   ],
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Document Manager",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 156, 156),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Add some space between the text and the line
                                Expanded(
                                  child: Divider(
                                    color: Colors
                                        .grey, // Customize the color of the line if needed
                                    height:
                                        1, // Adjust the height of the line if needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: Dimens.edgeInsets15,
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              OnHover(builder: (((isHovered) {
                                return createContentTile(
                                    title: "Document Manager",
                                    onTap: () {
                                      controller.goToDocumentManager();
                                    });
                              }))),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Assets",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 156, 156),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Add some space between the text and the line
                                Expanded(
                                  child: Divider(
                                    color: Colors
                                        .grey, // Customize the color of the line if needed
                                    height:
                                        1, // Adjust the height of the line if needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: Dimens.edgeInsets15,
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              _inventoryList(
                                  tittle: "Assets List",
                                  ontap: () {
                                    Get.toNamed(
                                      Routes.inventoryList,
                                    );
                                    //  controller.createChecklist();
                                  }),
                              _inventoryList(
                                  tittle: "Add Assets",
                                  ontap: () {
                                    Get.toNamed(
                                      Routes.addInventoryScreen,
                                    );
                                  }),
                              _inventoryList(
                                  tittle: "Import Assets",
                                  ontap: () {
                                    controller.clearStoreData();
                                    Get.toNamed(Routes.importInventory,
                                        arguments: {
                                          "importType":
                                              AppConstants.kImportAsset
                                        });
                                  }),
                              // _inventoryList(
                              //     tittle: "Inventory Category",
                              //     ontap: () {
                              //       Get.toNamed(
                              //         Routes.assetTypeListScreen,
                              //       );
                              //     }),
                              // _inventoryList(
                              //     tittle: "Inventory Type",
                              //     ontap: () {
                              //       Get.toNamed(
                              //       Routes.inventoryTypeListScreen,
                              //     );
                              //   }),
                              // _inventoryList(
                              //     tittle: "Inventory Status",
                              //     ontap: () {
                              //       Get.toNamed(
                              //         Routes.inventoryStatusListScreen,
                              //       );
                              //     }),
                            ],
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.all(16),
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              // _inventoryList(
                              //     tittle: "Warranty Certificates",
                              //     ontap: () {
                              //       // controller.pmSchedule();
                              //       Get.toNamed(
                              //         Routes.warrantyCertificate,
                              //       );
                              //     }),
                              // varUserAccessModel.value.access_list!
                              //             .where((e) =>
                              //                 e.feature_id ==
                              //                     UserAccessConstants
                              //                         .kWarrantyClaimFeatureId &&
                              //                 e.view ==
                              //                     UserAccessConstants
                              //                         .kHaveViewAccess)
                              //             .length >
                              //         0
                              //     ?
                              _inventoryList(
                                tittle: "Warranty Claims List",
                                ontap: () => controller.breakdownMaintenance(),
                              )
                              // : Container(),

                              // varUserAccessModel.value.access_list!
                              //             .where((e) =>
                              //                 e.feature_id ==
                              //                     UserAccessConstants
                              //                         .kWarrantyClaimFeatureId &&
                              //                 e.add ==
                              //                     UserAccessConstants
                              //                         .kHaveAddAccess)
                              //             .length >
                              //         0
                              //     ?
                              ,
                              _inventoryList(
                                  tittle: "New Warranty Claim",
                                  ontap: () {
                                    controller.newWarrantyClaimList();
                                  })
                              // : Container(),

                              // _inventoryList(
                              //     tittle: "Inventory Category",
                              //     ontap: () {
                              //       Get.toNamed(
                              //         Routes.assetTypeListScreen,
                              //       );
                              //     }),
                              // _inventoryList(
                              //     tittle: "Inventory Type",
                              //     ontap: () {
                              //       Get.toNamed(
                              //       Routes.inventoryTypeListScreen,
                              //     );
                              //   }),
                              // _inventoryList(
                              //     tittle: "Inventory Status",
                              //     ontap: () {
                              //       Get.toNamed(
                              //         Routes.inventoryStatusListScreen,
                              //       );
                              //     }),
                            ],
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.all(16),
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              // _inventoryList(
                              //     tittle: "Calibration Certificates",
                              //     ontap: () {
                              //       Get.toNamed(
                              //         Routes.calibrationCertificate,
                              //       );
                              //     }),
                              _inventoryList(
                                  tittle: "Calibration List",
                                  ontap: () {
                                    Get.toNamed(
                                      Routes.calibrationList,
                                    );
                                  }),
                              _inventoryList(
                                  tittle: "WC Certificates List",
                                  ontap: () {
                                    Get.toNamed(
                                      Routes.warrantyCertificatesList,
                                    );
                                  }),
                              // _inventoryList(
                              //     tittle: "Inventory Category",
                              //     ontap: () {
                              //       Get.toNamed(
                              //         Routes.assetTypeListScreen,
                              //       );
                              //     }),
                              // _inventoryList(
                              //     tittle: "Inventory Type",
                              //     ontap: () {
                              //       Get.toNamed(
                              //       Routes.inventoryTypeListScreen,
                              //     );
                              //   }),
                              // _inventoryList(
                              //     tittle: "Inventory Status",
                              //     ontap: () {
                              //       Get.toNamed(
                              //         Routes.inventoryStatusListScreen,
                              //       );
                              //     }),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Masters",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 156, 156),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Add some space between the text and the line
                                Expanded(
                                  child: Divider(
                                    color: Colors
                                        .grey, // Customize the color of the line if needed
                                    height:
                                        1, // Adjust the height of the line if needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.all(16),
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : (itemWidth / itemHeightWeb),
                            children: <Widget>[
                              _inventoryList(
                                  tittle: "Assets Category",
                                  ontap: () {
                                    Get.toNamed(
                                      Routes.inventoryCategory,
                                    );
                                  }),
                              _inventoryList(
                                  tittle: "Assets Type",
                                  ontap: () {
                                    Get.toNamed(
                                      Routes.inventoryTypeListScreen,
                                    );
                                  }),
                              _inventoryList(
                                  tittle: "Assets Status",
                                  ontap: () {
                                    controller.inventoryStatusScreen();
                                  }),
                            ],
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 20),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "MIS",
                          //         style: TextStyle(
                          //           color: Color.fromARGB(255, 159, 156, 156),
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //           width:
                          //               10), // Add some space between the text and the line
                          //       Expanded(
                          //         child: Divider(
                          //           color: Colors
                          //               .grey, // Customize the color of the line if needed
                          //           height:
                          //               1, // Adjust the height of the line if needed
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   primary: false,
                          //   padding: Dimens.edgeInsets15,
                          //   crossAxisSpacing: 70,
                          //   mainAxisSpacing: 6,
                          //   crossAxisCount:
                          //       Responsive.isMobile(context) ? 2 : 5,
                          //   childAspectRatio: Responsive.isMobile(context)
                          //       ? (itemWidth / itemHeight)
                          //       : (itemWidth / itemHeightWeb),
                          //   children: <Widget>[
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Type of observation",
                          //           onTap: () {
                          //             controller.goToTypeOfObservation();
                          //           });
                          //     }))),
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Source of observation",
                          //           onTap: () {
                          //             controller.goToSourceOfObservation();
                          //           });
                          //     }))),
                          //     OnHover(builder: (((isHovered) {
                          //       return createContentTile(
                          //           title: "Risk Type",
                          //           onTap: () {
                          //             controller.goToRiskType();
                          //           });
                          //     }))),
                          //   ],
                          // ),
                        ],
                      )),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  createContentTile({required String title, Function()? onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorValues.skyBlueColor,
            borderRadius: BorderRadius.circular(2),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: ColorValues.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),

                  textAlign: TextAlign.center, // Updated
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_inventoryList({required String tittle, Function()? ontap}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorValues.skyBlueColor,
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // padding: EdgeInsets.all(9),
        child:
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            Center(
          child: Text(
            tittle,
            style: TextStyle(
                color: ColorValues.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w700),

            textAlign: TextAlign.center, // Updated
          ),
          // ),
          // ],
        ),
      ),
    ),
  );
}
