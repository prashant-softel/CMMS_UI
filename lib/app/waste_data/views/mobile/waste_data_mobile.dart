import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/waste_data/waste_data_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WasteDataMobile extends GetView<WasteDataController> {
  WasteDataMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 30,
                      width: 80,
                      child: Center(child: Text("")),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("Waste Generated ")],
                      ),
                      Column(
                        children: [Text("Waste disposed ")],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: ColorValues.appDarkGreyColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Center(child: Text("E- waste")),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 150,
                            child: TextField(
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16.0,
                                    height: 1.0,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 150,
                            child: TextField(
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16.0,
                                    height: 1.0,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Column(
            //       children: [Text("data")],
            //     ),
            //     Spacer(),
            //     Container(
            //       width: MediaQuery.of(context).size.width * 0.70,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Column(
            //             children: [Text("dghhnata")],
            //           ),
            //           Column(
            //             children: [Text("hg")],
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
