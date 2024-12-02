import 'dart:math';

import 'package:clock_app/controller/homecontroller.dart';
import 'package:clock_app/painter/painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clock extends GetView<HomeController> {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 90),
        child: Obx(
          () {
            return AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? const Color.fromARGB(255, 52, 52, 52)
                        : const Color.fromARGB(255, 254, 238, 238),
                    shape: BoxShape.circle),
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: CustomPaint(
                    painter: ClockPainter(dateTime: controller.dateTime.value),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
