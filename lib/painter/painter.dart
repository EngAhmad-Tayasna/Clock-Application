import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ClockPainter extends CustomPainter {
  DateTime? dateTime;
  ClockPainter({this.dateTime});
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // 6
    canvas.drawLine(
        Offset(10, centerY),
        Offset(30, centerY),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);

    // 9
    canvas.drawLine(
        Offset(centerX, 10),
        Offset(centerX, 30),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);

    // 12
    canvas.drawLine(
        Offset(centerX * 2 - 30, centerX),
        Offset(centerX * 2 - 10, centerX),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);

    // 3
    canvas.drawLine(
        Offset(centerX, centerY * 2 - 30),
        Offset(centerX, centerY * 2 - 10),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);

    // hour calc
    double hourX = centerX +
        size.width *
            .25 *
            cos((dateTime!.hour * 30 + dateTime!.minute * .5) * pi / 180);

    double hourY = centerY +
        size.width *
            .25 *
            sin((dateTime!.hour * 30 + dateTime!.minute * .5) * pi / 180);

    Paint hourPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawLine(center, Offset(hourX, hourY), hourPaint);

    // min calc
    double minX =
        centerX + size.width * .4 * cos((dateTime!.minute * 6) * pi / 180);

    double minY =
        centerY + size.width * .4 * sin((dateTime!.minute * 6) * pi / 180);

    Paint minPaint = Paint()
      ..color = Get.isDarkMode
          ? const Color.fromARGB(225, 255, 255, 255)
          : Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawLine(center, Offset(minX, minY), minPaint);

    // sec calc
    double secX =
        centerX + size.width * .45 * cos((dateTime!.second * 6) * pi / 180);

    double secY =
        centerY + size.width * .45 * sin((dateTime!.second * 6) * pi / 180);

    Paint secPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.drawLine(center, Offset(secX, secY), secPaint);

    Paint dotPaint = Paint()..color = Colors.grey;
    canvas.drawCircle(center, 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
