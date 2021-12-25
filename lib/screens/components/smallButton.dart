// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  // ignore: prefer_typing_uninitialized_variables
  final isLoading;
  // ignore: prefer_typing_uninitialized_variables
  final loadingColor;
  // ignore: use_key_in_widget_constructors
  const SmallButton(
      {@required this.onPressed,
      @required this.title,
      this.color,
      this.isLoading = false,
      this.loadingColor = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: color == null ? Colors.white : kPrimaryColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kPrimaryColor, width: 1.5)),
        child: Center(
          child: isLoading != true
              ? Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Khebrat Musamim',
                    color: color == null ? kPrimaryColor : Colors.white,
                    fontSize: 18,
                  ),
                )
              : SpinKitChasingDots(
                  size: 20,
                  color: loadingColor ?? Colors.white,
                ),
        ),
      ),
    );
  }
}
