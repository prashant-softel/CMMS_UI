import 'package:flutter/cupertino.dart';

class TooltipMenuShape extends ShapeBorder {
  const TooltipMenuShape();

  final BorderSide _side = BorderSide.none;
  final BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(
    Rect rect, {
    TextDirection? textDirection,
  }) {
    final path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final rect1 = _borderRadius.resolve(textDirection).toRRect(rect);

    path.moveTo(0, 10);
    path.quadraticBezierTo(0, 0, 10, 0);
    path.lineTo(rect1.width - 30, 0);
    path.lineTo(rect1.width - 20, -10);
    path.lineTo(rect1.width - 10, 0);
    path.quadraticBezierTo(rect1.width, 0, rect1.width, 10);
    path.lineTo(rect1.width, rect1.height - 10);
    path.quadraticBezierTo(
        rect1.width, rect1.height, rect1.width - 10, rect1.height);
    path.lineTo(10, rect1.height);
    path.quadraticBezierTo(0, rect1.height, 0, rect1.height - 10);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => RoundedRectangleBorder(
        side: _side.scale(t),
        borderRadius: _borderRadius * t,
      );
}
