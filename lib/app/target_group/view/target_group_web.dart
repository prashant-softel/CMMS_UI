// import 'dart:ffi';

// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/constant/constant.dart';
// import 'package:cmms/app/home/widgets/header_widget.dart';
// import 'package:cmms/app/widgets/custom_richtext.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';




// class TargetGroup extends GetView<TargetGroupController>{
//   TargetGroup({key? key}) : super(key: key);
//   final TargetGroupCotroller controller = Get.find();

//   @override
//   Widget build(BuildContext context){
//   return SelectionArea(
//     child Obx(
//       () => Container(
//         color: Color.fromARGB(255, 234, 236, 238),
//         width: Get.height,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HeaderWidget(),
//             Container(
//               height: 45,
//               decoration:BoxDecoration(
//                 border: Border.all(
//                   color: Color.fromARGB(255, 227, 224, 224),
//                   width: 1,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0,2),
//                   ),
//                 ]
//               ),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: ColorValues.greyLightColor,
//                   ),
//                   InkWell(
//                     onTap: (){
//                       Get.offNamed(Routes.home);
//                     },
//                     child: Text("/ MIS," style: Styles.greyLight14),
//                   ),
//                   Text(" /TARGET GROUP",style:Styles.greyLight14),
//                 ],
//               ),
//             ),

//               Padding(
//                 padding:EdgeInsets.only(left:10,top:10),
//                 child: ElevatedButton(
//                   style: Styles.navyBlueElevatedButtonStyle,
//                   onPressed: (){
//                     controller.toggleContainer();
//                   },
//                   child: Obx((){
//                     return Text(
//                       controller.isContainerVisible.value
//                       ?'Close Target Group'
//                       :'Open  Target Group',
//                     );
//                   }),
//                 ),
//               )
//               Expanded(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Visibility(
//                       visible: controller.isContainerVisible.value,
//                       child: Container(
//                         width: (Get.width * .3),
//                         margin: EdgeInsets.only(left: 15, top: 20),
//                         height: Get.height/2.5,
//                         child: Card(
//                           color: Color.fromARGB(255, 251, 252, 253),
//                           elevation: 10,
//                           shape: RoundedRectangleBorder(
//                             borderRadius:BorderRadius.circular(10.0),
//                           ),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 10.0,right: 10,top:10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment,start,
//                                   children: [
//                                     Text(
//                                       "Create Target Group",
//                                       style: Styles.blackBold16,
//                                     ),
//                                     SizedBox(
//                                       height: 30,
//                                     ),
//                                     Visibility(
//                                       visible: controller.isSuccess.value,
//                                       child: Center(
//                                         child: Wrap(
//                                           children: [
//                                             Text(
//                                               controller.selectItem  == null
//                                               ?"Target Group  added Successfully in the List."
//                                               : "Target Group Update Successfully in the List.",
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: Color.fromARGB(255, 24, 243, 123)
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 15,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: CustomRichText(
//                                             title: 'Traget Group Name:'),
//                                           ),
//                                         Container(
//                                           width: (MediaQuery.of(context)
//                                           .size
//                                           .width * .2
//                                           ),
//                                           height: 30,
//                                           decoration: BoxDecoration(
//                                             boxShadow:[
//                                               BoxShadow(
//                                                 color: Colors.black26,
//                                                 offset: const Offset(
//                                                   5.0,
//                                                   5.0),
//                                                   blurRadius:5.0,
//                                                   spreadRadius: 0.0,
//                                               ),
                                              
//                                             ],
//                                             color: ColorValues.whiteColor,
//                                             borderRadius: BorderRadius.circular(5),
//                                           ),
//                                           child: TextField(
//                                             style: TextStyle(
//                                               fontSize: 14.0,
//                                               height: 1.0,
//                                               color: Colors.black),
//                                               controller: controller.titleCtrlr,
//                                               focusNode: controller.rnameFocus,
//                                               scrollController: controller.rnameScroll,
//                                               keyboardType: TextInputType.multiline,
//                                               autofocus: false,
//                                               decoration: InputDecoration(
//                                                 fillColor:ColorValues.whiteColor,
//                                                 filled: true,
//                                                 contentPadding: EdgeInsets.only(
//                                                   left: 5,right: 5 ),
//                                                   border: InputBorder.none,
//                                                   enabledBorder: 
//                                                   OutlineInputBorder(
//                                                     borderRadius: BorderRadius.circular(10.0),
//                                                     borderSide: BorderSide(
//                                                       color: Colors.transparent)
//                                                     ),
//                                                     focusedBorder: 
//                                                     OutlineInputBorder(
//                                                       borderRadius:
//                                                        BorderRadius.circular(10.0),
//                                                        borderSide: BorderSide(color:Colors.transparent),//BorderSide
//                                                        ),
//                                                        focusedErrorBorder: controller.isTitleInvalid.value? OutlineInputBorder(
//                                                         borderRadius: BorderRadius.circular(5),
//                                                         borderSide: BorderSide(
//                                                           color: ColorValues.redColorDark,
//                                                         )
//                                                        )
//                                                        :InputBorder.none,
//                                                        errorBorder: controller.isTitleInvalid.value? OutlineInputBorder(
//                                                         borderRadius: BorderRadius.circular(5),
//                                                         borderSide: BorderSide(
//                                                           color: ColorValues.redColorDark,
//                                                         )
//                                                        )
//                                                        :null,
//                                                        errorText: controller.isTitleInvalid.value? "Required field" : null,

//                                                        hintStyle: TextStyle(height: 2.0),

//                                                   ),
//                                                   onChanged: (value){
//                                                     if(value.trim().length>1){
//                                                       controller.isTitleInvalid.value=false;
//                                                     }else{
//                                                       controller.isTitleInvalid.value=true;

//                                                     }
//                                                   },
//                                                   inputFormatters: [
//                                                     FilteringTextInputFormatter.deny(RegExp('[\'^]'),
//                                                     )
//                                                   ],
//                                               ),
//                                             ), 
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
                                
                                
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//           ],
//         ),
//       ))
//   )
//   }
// }