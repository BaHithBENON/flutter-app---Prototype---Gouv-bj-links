import 'package:flutter/material.dart';

class BackCliper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.07, size.height * 0.08);
    path.quadraticBezierTo(size.width * 0.07, size.height * 0.04,
        size.width * 0.13, size.height * 0.04);
    path.cubicTo(size.width * 0.32, size.height * 0.04, size.width * 0.68,
        size.height * 0.04, size.width * 0.87, size.height * 0.04);
    path.quadraticBezierTo(size.width * 0.93, size.height * 0.04,
        size.width * 0.93, size.height * 0.08);
    path.quadraticBezierTo(size.width * 0.93, size.height * 0.44,
        size.width * 0.93, size.height * 0.56);
    path.cubicTo(size.width * 0.93, size.height * 0.72, size.width * 0.61,
        size.height * 0.81, size.width * 0.53, size.height * 0.84);
    path.quadraticBezierTo(size.width * 0.49, size.height * 0.85,
        size.width * 0.46, size.height * 0.84);
    path.quadraticBezierTo(size.width * 0.07, size.height * 0.72,
        size.width * 0.07, size.height * 0.56);
    path.quadraticBezierTo(size.width * 0.07, size.height * 0.44,
        size.width * 0.07, size.height * 0.08);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}