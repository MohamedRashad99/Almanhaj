// ignore_for_file: file_names

import '../search_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:almanhaj/screens/home_screen/view.dart';
import 'package:get/get.dart';


import 'constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final IconData? icon;

  // ignore: use_key_in_widget_constructors
  CustomAppBar({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .12,
      width: double.infinity,
      padding: EdgeInsets.only(top: height * .05),
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title!,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
customAppBar({required BuildContext context, required VoidCallback press} ) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: InkWell(
      onTap: () {
        Get.off(()=>const HomeScreen());
      },
      child: Image.asset(
        "assets/image/logo2021-2.png",
        width: 130,
        height: 60,
        fit: BoxFit.contain,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {

           // SearchView
            Get.to(()=> const SearchView());
            //showSearch(context: context, delegate: SubjectOfSearch());
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 35,
          )),
      IconButton(
          onPressed: press,
          icon: const Icon(
            Icons.format_align_justify,
            color: Colors.black,
            size: 30,
          )),
    ],
  );
}

