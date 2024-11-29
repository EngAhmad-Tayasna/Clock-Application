import 'package:clock_app/controller/homecontroller.dart';
import 'package:clock_app/view/widget/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clock",
            style: Get.isDarkMode
                ? GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal)
                : GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal)),
        centerTitle: true,
        elevation: 10,
        shadowColor: const Color(0xFF000029),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FlutterSwitch(
                width: 60,
                height: 30,
                toggleSize: 24,
                value: controller.status.value,
                borderRadius: 30,
                // padding: 2,
                activeToggleColor: const Color(0xFF6E40C9),
                inactiveToggleColor: const Color(0xFF2F3630),
                activeSwitchBorder:
                    Border.all(color: const Color(0xFF3C1E70), width: 1),
                inactiveSwitchBorder:
                    Border.all(color: const Color(0xFFD1D5DA), width: 1),
                activeColor: const Color(0xFF271052),
                inactiveColor: Colors.white,
                activeIcon: const Icon(
                  Icons.nightlight_round,
                  color: Color(0xFFF8E3A1),
                  // size: 5,
                ),
                inactiveIcon: const Icon(
                  Icons.wb_sunny,
                  color: Color(0xFFFFDF5D),
                ),
                onToggle: (val) {
                  controller.status.value = val;

                  if (Get.isDarkMode) {
                    Get.changeThemeMode(ThemeMode.light);
                  } else {
                    Get.changeThemeMode(ThemeMode.dark);
                  }

                  (context as Element).markNeedsBuild();
                }),
          )
        ],
      ),
      body: Column(
        children: [
          const Clock(),
          const SizedBox(
            height: 45,
          ),
          Obx(() => Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 280,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? const Color(0xff141414)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(44),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xff000029),
                              blurRadius: 20,
                              spreadRadius: 6)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("date : ",
                            style: Get.isDarkMode
                                ? GoogleFonts.poppins(
                                    color: const Color(0xffC9C9C9),
                                    fontSize: 12)
                                : GoogleFonts.poppins(
                                    color: const Color(0xffC9C9C9),
                                    fontSize: 12)),
                        const SizedBox(width: 16),
                        Text(
                          DateFormat("d - MMM - y ")
                              .format(controller.dateTime.value),
                          style: Get.isDarkMode
                              ? GoogleFonts.poppins(
                                  color: const Color(0xffC9C9C9), fontSize: 21)
                              : GoogleFonts.poppins(
                                  color: const Color(0xff686868), fontSize: 21),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    alignment: Alignment.center,
                    width: 280,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? const Color(0xff141414)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(44),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xff000029),
                              blurRadius: 20,
                              spreadRadius: 6)
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("time : ",
                            style: Get.isDarkMode
                                ? GoogleFonts.poppins(
                                    color: const Color(0xffc9c9c9),
                                    fontSize: 12)
                                : GoogleFonts.poppins(
                                    color: const Color(0xffc9c9c9),
                                    fontSize: 12)),
                        const SizedBox(width: 32),
                        Text(
                          DateFormat("h : m : s a")
                              .format(controller.dateTime.value),
                          style: Get.isDarkMode
                              ? GoogleFonts.poppins(
                                  color: const Color(0xffC9C9C9), fontSize: 21)
                              : GoogleFonts.poppins(
                                  color: const Color(0xff686868), fontSize: 21),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
