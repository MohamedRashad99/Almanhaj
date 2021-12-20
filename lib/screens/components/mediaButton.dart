// ignore_for_file: deprecated_member_use, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MediaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final String? icon;
  final Color? color;
  final Color? textColor;
  const MediaButton(
      {@required this.onPressed,
      @required this.title,
      this.icon,
      this.color,
      this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.2,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15, child: Image.asset(icon!)),
            const SizedBox(
              width: 3,
            ),
            Text(
              title!,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
        color: Colors.white,
        onPressed: onPressed,
        elevation: 3,
      ),
    );
  }
}
