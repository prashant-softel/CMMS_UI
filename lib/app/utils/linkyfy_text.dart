// import 'package:cmms/app/app.dart';
// import 'package:cmms/domain/domain.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// /// Text widget, that turns URLs, email and phone numbers into clickable inline links in text for flutter
// ///
// class LinkyfyText extends StatefulWidget {
//   LinkyfyText({
//     Key? key,
//     @required this.text,
//     @required this.textStyle,
//     @required this.linkStyle,
//     this.onWebLinkTap,
//     this.onEmailTap,
//     this.onPhoneTap,
//     this.maxLines,
//   }) : super(key: key);

//   final String? text;
//   final int? maxLines;
//   final Function(String)? onWebLinkTap, onPhoneTap, onEmailTap;
//   final TextStyle? textStyle, linkStyle;

//   @override
//   State<LinkyfyText> createState() => _LinkyfyTextState();
// }

// class _LinkyfyTextState extends State<LinkyfyText> {
//   final humanize = false;

//   var maxLine = 5;
//   var isReadMore = false;

//   void _onLinkTap(String link, MatchType type) {
//     switch (type) {
//       case MatchType.phone:
//         widget.onPhoneTap!(link);
//         break;
//       case MatchType.email:
//         widget.onEmailTap!(link);
//         break;
//       case MatchType.link:
//         widget.onWebLinkTap!(link);
//         break;
//       case MatchType.none:
//         break;
//     }
//   }

//   String _getTypes() {
//     var types = '';
//     if (widget.onWebLinkTap != null) types += 'web';
//     if (widget.onEmailTap != null) types += 'email';
//     if (widget.onPhoneTap != null) types += 'phone';
//     return types;
//   }

//   List<TextSpan> _buildTextSpans() =>
//       _findMatches(widget.text!, _getTypes(), humanize).map((match) {
//         if (match.type == MatchType.none) {
//           return TextSpan(text: match.text, style: widget.textStyle);
//         }
//         if (match.type == MatchType.phone) {
//           if (match.text!.length < 9) {
//             return TextSpan(text: match.text, style: widget.textStyle);
//           }
//         }
//         final recognizer = TapGestureRecognizer();
//         recognizer.onTap = () => _onLinkTap(match.text!, match.type!);
//         return TextSpan(
//             text: match.text, style: widget.linkStyle, recognizer: recognizer);
//       }).toList();

//   @override
//   Widget build(BuildContext context) => AnimatedSize(
//         duration: const Duration(milliseconds: 50),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             RichText(
//               maxLines: widget.maxLines ?? (isReadMore ? 5 : 3),
//               // overflow: TextOverflow.ellipsis,
//               text: TextSpan(
//                 children: [
//                   ..._buildTextSpans(),
//                 ],
//               ),
//             ),
//             widget.text!.length >= 150
//                 ? isReadMore
//                     ? GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             isReadMore = !isReadMore;
//                           });
//                         },
//                         child: Text(
//                           isReadMore ? 'less' : '',
//                           style: Styles.blackBold12.copyWith(
//                             color: Theme.of(context).secondaryHeaderColor,
//                           ),
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             isReadMore = !isReadMore;
//                           });
//                         },
//                         child: Text(
//                           !isReadMore ? '...more' : '',
//                           style: Styles.blackBold12.copyWith(
//                             color: Theme.of(context).secondaryHeaderColor,
//                           ),
//                         ),
//                       )
//                 : Dimens.box0,
//           ],
//         ),
//       );
// }

// RegExp _phoneRegExp = RegExp(r'[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*');
// RegExp _emailRegExp = RegExp(
//     r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*");
// RegExp _linksRegExp =
//     RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');

// // RegExp(
// //     r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})');

// class _MatchedString {
//   _MatchedString({this.text, this.type});

//   final MatchType? type;
//   final String? text;

//   @override
//   String toString() => text!;
// }

// List<_MatchedString> _findMatches(String text, String types, bool humanize) {
//   var matched = <_MatchedString>[
//     _MatchedString(type: MatchType.none, text: text)
//   ];
//   if (types.contains('phone')) {
//     var newMatched = <_MatchedString>[];
//     for (var matchedBefore in matched) {
//       if (matchedBefore.type == MatchType.none) {
//         newMatched
//             .addAll(_findLinksByType(matchedBefore.text!, MatchType.phone));
//       } else {
//         newMatched.add(matchedBefore);
//       }
//     }
//     matched = newMatched;
//   }

//   if (types.contains('email')) {
//     var newMatched = <_MatchedString>[];
//     for (var matchedBefore in matched) {
//       if (matchedBefore.type == MatchType.none) {
//         newMatched
//             .addAll(_findLinksByType(matchedBefore.text!, MatchType.email));
//       } else {
//         newMatched.add(matchedBefore);
//       }
//     }
//     matched = newMatched;
//   }

//   if (types.contains('web')) {
//     var newMatched = <_MatchedString>[];
//     for (var matchedBefore in matched) {
//       if (matchedBefore.type == MatchType.none) {
//         final webMatches =
//             _findLinksByType(matchedBefore.text!, MatchType.link);
//         for (var webMatch in webMatches) {
//           if (webMatch.type == MatchType.link &&
//               (webMatch.text!.startsWith('http://') ||
//                   webMatch.text!.startsWith('https://') ||
//                   _linksRegExp.hasMatch(webMatch.text!)) &&
//               humanize) {
//             newMatched.add(_MatchedString(
//                 text: webMatch.text!
//                     .substring(webMatch.text!.startsWith('http://') ? 7 : 8),
//                 type: MatchType.link));
//           } else {
//             newMatched.add(webMatch);
//           }
//         }
//       } else {
//         newMatched.add(matchedBefore);
//       }
//     }
//     matched = newMatched;
//   }

//   return matched;
// }

// RegExp? _getRegExpByType(MatchType type) {
//   switch (type) {
//     case MatchType.phone:
//       return _phoneRegExp;
//     case MatchType.email:
//       return _emailRegExp;
//     case MatchType.link:
//       return _linksRegExp;
//     default:
//       return null;
//   }
// }

// List<_MatchedString> _findLinksByType(String text, MatchType type) {
//   var output = <_MatchedString>[];
//   final matches = _getRegExpByType(type)!.allMatches(text);
//   var endOfMatch = 0;
//   for (Match match in matches) {
//     final before = text.substring(endOfMatch, match.start);
//     if (before.isNotEmpty) {
//       output.add(_MatchedString(text: before, type: MatchType.none));
//     }
//     final lastCharacterIndex =
//         text[match.end - 1] == ' ' ? match.end - 1 : match.end;
//     output.add(_MatchedString(
//         type: type, text: text.substring(match.start, lastCharacterIndex)));
//     endOfMatch = lastCharacterIndex;
//   }
//   final endOfText = text.substring(endOfMatch);
//   if (endOfText.isNotEmpty) {
//     output.add(_MatchedString(text: endOfText, type: MatchType.none));
//   }
//   return output;
// }
