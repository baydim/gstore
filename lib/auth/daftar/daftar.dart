import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/auth/widgetauth.dart';
import 'package:gstore/backend/auth.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';

class Daftar extends StatefulWidget {
  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  TextEditingController em = TextEditingController();
  TextEditingController pw = TextEditingController();
  Masuk _masuk = Get.put(Masuk());
  bool hat = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bawah(100),
            Text(
              "Daftar.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                fom(
                  "Email",
                  (value) {
                    setState(() {});
                  },
                  em,
                  Icons.account_circle_rounded,
                  false,
                  TextInputType.emailAddress,
                  null,
                ),
                bawah(15),
                fom(
                  "Password",
                  (value) {
                    setState(() {});
                  },
                  pw,
                  Icons.lock_rounded,
                  hat,
                  TextInputType.visiblePassword,
                  InkWell(
                    onTap: () {
                      setState(() {
                        !hat ? hat = true : hat = false;
                      });
                    },
                    child: Icon(
                      !hat
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  ),
                ),
                bawah(15),
              ],
            ),
            em.text.length == 0 || em.text.length == 0
                ? Container(
                    width: Get.width,
                    height: 70,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        boxShadow1,
                      ],
                    ),
                    child: Container(
                      // margin: EdgeInsets.only(left: 15, right: 15),
                      width: Get.width,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [boxShadow1],
                      ),
                      child: Center(
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            fontSize: font14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      _masuk.daftar(em.text, pw.text);
                    },
                    child: Container(
                      width: Get.width,
                      height: 70,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          boxShadow1,
                        ],
                      ),
                      child: Container(
                        // margin: EdgeInsets.only(left: 15, right: 15),
                        width: Get.width,
                        height: 40,
                        decoration: BoxDecoration(
                          color: oren,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [boxShadow1],
                        ),
                        child: Center(
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              fontSize: font14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),

      // CustomScrollView(
      //   slivers: <Widget>[
      //     slivbawah(20),
      //     SliverAppBar(
      //       backgroundColor: Colors.white,
      //       pinned: true,
      //       elevation: 0.5,
      //       automaticallyImplyLeading: false,
      //       toolbarHeight: 60,
      //       title: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           InkWell(
      //             onTap: () {
      //               Get.back();
      //             },
      //             child: Container(
      //               width: 40,
      //               height: 40,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.circular(100),
      //                 boxShadow: [
      //                   boxShadow1,
      //                 ],
      //               ),
      //               child: Center(
      //                 child: Icon(
      //                   Icons.arrow_back_rounded,
      //                   color: oren,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Text(
      //             "Daftar",
      //             style: TextStyle(color: oren),
      //           )
      //         ],
      //       ),
      //     ),
      //     slivbawah(200),
      //     SliverToBoxAdapter(
      //       child:
      //     ),
      //   ],
      // ),
    );
  }
}
