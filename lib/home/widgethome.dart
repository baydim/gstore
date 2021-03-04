import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/beli.dart';
import 'package:gstore/cart/cart.dart';
import 'package:gstore/css/css.dart';

Widget slivapp(String email) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
    floating: true,
    toolbarHeight: 60,
    backgroundColor: Colors.transparent,
    elevation: 0,
    forceElevated: false,
    title: Container(
      margin: EdgeInsets.only(left: 15, right: 15),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: EdgeInsets.all(0),
              width: 35,
              height: 35,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Hero(
                  tag: "z",
                  child: Image.asset(
                    'assets/i.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Gandini",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " Store",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(Cart(email));
              },
              child: Container(
                width: 40,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        color: oren,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(5),
                          child: StreamBuilder<QuerySnapshot>(
                            stream: Beli.beli
                                .where('email', isEqualTo: email)
                                .orderBy('wak', descending: true)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text(
                                  "..",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                );
                              }
                              if (snapshot.hasData) {
                                var i = snapshot.data.docs.length;
                                return Text(
                                  i.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                );
                              }

                              return Text(
                                "..",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              );
                            },
                          )

                          // Text(
                          //   "4",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 13,
                          //   ),
                          // ),
                          ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
