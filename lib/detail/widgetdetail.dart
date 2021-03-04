import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:url_launcher/url_launcher.dart';

void _launch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Not supported");
  }
}

Widget detapp(String status, String gambar) {
  return SliverAppBar(
    expandedHeight: Get.width,
    backgroundColor: Colors.white,
    pinned: true,
    elevation: 0.5,
    automaticallyImplyLeading: false,
    toolbarHeight: 60,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                boxShadow1,
              ],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_rounded,
                color: oren,
              ),
            ),
          ),
        ),
        Row(
          children: [
            status == null
                ? SizedBox(
                    width: 10,
                  )
                : Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        color:
                            status == "Keranjang" ? Colors.red : Colors.green,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          boxShadow1,
                        ]),
                    child: Center(
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: font13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
            samping(15),
            InkWell(
              onTap: () {
                _launch('whatsapp://send?phone=+6285735379740');
              },
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    boxShadow1,
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    "assets/wa.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: Hero(
        tag: gambar,
        child: Image.network(
          gambar,
          fit: BoxFit.cover,
        ),
      ),
      // Image.asset(
      //   "assets/ebook.jpg",
      //   fit: BoxFit.cover,
      // ),

      // width: Get.width,
      // height: Get.width,
    ),
  );
}

Widget bol(IconData icon, Function f) {
  return InkWell(
    onTap: f,
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: oren,
        shape: BoxShape.circle,
        boxShadow: [
          boxShadow1,
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    ),
  );
}
