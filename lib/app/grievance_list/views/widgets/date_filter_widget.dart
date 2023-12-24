import 'package:flutter/material.dart';

import '../../../utils/date_range_picker.dart';

///WEEK SELECTION WIDGET (CALENDAR)
class DateFilterWidget extends StatefulWidget {
  DateFilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 10.0,
          ),

          ///DateRangePicker/Selected-Week-Display
          Center(
            child: Container(
              //height: 40.0,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DateRangePicker(callback: () {}),
            ),
          ),
        ],
      ),
    );
  }

  // getMeetings(endOfWeekDate) async {
  //   try {
  //     String? bearerToken = await AccessTokenManager().getValidToken();
  //     if (bearerToken == null || bearerToken.isEmpty) {
  //       Navigator.pushNamed(context, MyRoutes.loginRoute);
  //     } else {
  //       bool result = await InternetConnectionChecker().hasConnection;
  //       if (result == true) {
  //         String endOfWeekDateString =
  //             DateFormat('yyyy-MM-dd').format(endOfWeekDate);
  //         final uri = Uri.parse(
  //             AppUrls.WEEKLY_AGENDAS + "?endOfWeekDate=" + endOfWeekDateString);
  //         final response = await http.get(uri, headers: {
  //           HttpHeaders.contentTypeHeader: "application/json",
  //           HttpHeaders.authorizationHeader: "Bearer $bearerToken"
  //         });
  //         if (response.statusCode == 200) {
  //           var weeklyMeetingsResponse = jsonDecode(response.body);
  //           setState(() {
  //             weeklyMeetingsList = (weeklyMeetingsResponse as List)
  //                 .map((data) => WeeklyMeeting.fromJson(data))
  //                 .toList();

  //             /// Sort the list by datetime property
  //             weeklyMeetingsList.sort((a, b) => a.date!.millisecondsSinceEpoch
  //                 .compareTo(b.date!.millisecondsSinceEpoch));

  //             ///Generate a list fo checkboxes, 1 for each meeting
  //             isCheckedList =
  //                 List.generate(weeklyMeetingsList.length, (index) => false);
  //           });
  //         } else {
  //           GlobalSnackBar.show(
  //             context,
  //             Constants.UNEXPECTED_RESPONSE + response.statusCode.toString(),
  //           );
  //         }
  //       } else {
  //         toastDisplay(AppStrings.unable_to_get_meeting_tags);
  //       }
  //     }
  //   } catch (e) {
  //     GlobalSnackBar.show(context, e.toString());
  //   } finally {
  //     reset();
  //   }
  // }

  ///
}
