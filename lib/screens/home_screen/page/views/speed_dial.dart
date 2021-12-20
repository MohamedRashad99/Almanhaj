// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class FloatingActionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: SpeedDial(
        foregroundColor: Colors.white,
        overlayColor: HexColor("#323232"),
        backgroundColor: HexColor("#3080D1"),
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(10),
        spaceBetweenChildren: 4,
        dialRoot: customDialRoot
            ? (ctx, open, toggleChildren) {
          return ElevatedButton(
            onPressed: toggleChildren,
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding:
              const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            ),
            child: const Text(
              "Custom Dial Root",
              style:  TextStyle(fontSize: 17),
            ),
          );
        }
            : null,
        buttonSize: buttonSize,
        label: extend ? const Text("Open") : null,
        activeLabel: extend ? const Text("Close") : null,
        childrenButtonSize: buttonSize,
        visible: visible,
        direction: speedDialDirection,
        switchLabelPosition: switchLabelPosition,
        closeManually: closeManually,
        renderOverlay: renderOverlay,
        useRotationAnimation: useRAnimation,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        elevation: 0.0,
        isOpenOnStart: false,
        animationSpeed: 200,
        childMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          SpeedDialChild(
            labelStyle: headingStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            backgroundColor: Colors.white,
            labelBackgroundColor: Colors.black,
            foregroundColor: Colors.black,
            label: 'اطلب المذكرة',
            onTap: () {
               launch("https://m.me/elmanhg");
            },
          ),
          SpeedDialChild(
            labelStyle: headingStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            backgroundColor: Colors.white,
            labelBackgroundColor: Colors.black,
            foregroundColor: Colors.black,
            label: 'جروب المنهج التعليمي',
            onTap: () {
               launch("https://www.facebook.com/groups/229673250760836");
            },
          ),
          SpeedDialChild(
            labelStyle: headingStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            backgroundColor: Colors.white,
            labelBackgroundColor: Colors.black,
            foregroundColor: Colors.black,
            label: 'صفحتنا علي الفيسبوك',
            onTap: () {
              launch("https://www.facebook.com/elmanhg/");
            },
          ),
        ],
      ),
    );
  }


  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var rmIcons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var buttonSize = const Size(56.0, 56.0);
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var selectLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
}
