import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';

Widget m(IconData icon, String nama, String isi, String jelas) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        width: Get.width,
        height: 90,
        child: Stack(
          children: <Widget>[
            Icon(
              icon,
              color: oren,
              size: 30,
            ),
            Positioned(
              top: 0,
              left: 45,
              child: Container(
                width: Get.width / 1.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: TextStyle(
                        // color: Colors.grey,
                        fontSize: font13,
                      ),
                    ),
                    bawah(5),
                    Text(
                      isi,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: font14,
                      ),
                    ),
                    bawah(5),
                    Text(
                      jelas,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: font13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bawah(5),
      Divider(
        indent: 60,
        endIndent: 15,
        height: 0,
        color: oren.withOpacity(0.6),
      ),
    ],
  );
}
