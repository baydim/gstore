import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget appcari(Widget textf) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
    floating: true,
    toolbarHeight: 60,
    backgroundColor: Colors.transparent,
    elevation: 0,
    forceElevated: false,
    title: Container(
      padding: EdgeInsets.only(left: 15, right: 0),
      // margin: EdgeInsets.only(left: 15, right: 15),
      width: Get.width,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 5,
          ),
        ],
      ),
      child: textf,
    ),
  );
}
