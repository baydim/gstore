import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';

Widget cad(double l, double t, double r, double b, String image, String nama,
    int harga, int coret, int stock) {
  return Container(
    margin: EdgeInsets.fromLTRB(l, t, r, b),
    padding: EdgeInsets.all(10),
    width: 150,
    // height: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [boxShadow1],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            width: Get.width,
            height: 150,
            child: Hero(
              tag: image,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  if (loadingProgress != null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ),
        // Image.asset(
        //   image,
        //   fit: BoxFit.fitWidth,
        // ),
        Divider(
          height: 0,
        ),
        bawah(5),
        Text(
          nama,
          maxLines: 2,
          style: TextStyle(
            fontSize: font12,
          ),
        ),
        Text(
          forhar.format(
            harga,
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: font13,
          ),
        ),
        bawah(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              forhar.format(
                coret,
              ),
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: font13,
              ),
            ),
            Text(
              "Stock $stock",
              style: TextStyle(
                color: Colors.grey,
                fontSize: font12,
              ),
            )
          ],
        )
      ],
    ),
  );
}
