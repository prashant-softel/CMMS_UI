import 'package:flutter/material.dart';
class TrainingCourseMobile extends StatelessWidget {
const TrainingCourseMobile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
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
                    )
                  ],
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [Text("")],)
                    ]
                  ),
                )
              ],
            )
          ],
        ), 
      ),
    );
  }
}