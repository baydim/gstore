import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/beli.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:intl/intl.dart';
// void _launch(url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     print("Not supported");
//   }
// }

Widget sliv(void f) {
  return SliverAppBar(
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
            f;
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
            Text(
              "Keranjang",
              style: TextStyle(fontSize: 16, color: oren),
            ),
            samping(5),
            Icon(
              Icons.shopping_cart_rounded,
              color: oren,
            ),
          ],
        )
      ],
    ),
  );
}

Widget list(Timestamp waktu, String nama, int harga, int jum, String status,
    String idpesan, String gambar) {
  final f = new DateFormat('EEEE,d-MM-yyyy % hh:mm', "id_ID");
  String w = f.format(waktu.toDate());

  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                w.split(' ')[0],
                style: TextStyle(
                  fontSize: font13,
                  color: Colors.grey,
                ),
              ),
              Text(
                w.split('%')[1],
                style: TextStyle(
                  fontSize: font13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          actions: [
            IconSlideAction(
              caption: 'Batalkan',
              color: Colors.transparent,
              icon: Icons.close_rounded,
              foregroundColor: Colors.red,
              onTap: () {
                status == "Keranjang"
                    ? Beli.batalkan(idpesan)
                    : Get.bottomSheet(
                        tidakbisa(),
                        backgroundColor: Colors.transparent,
                      );
              },
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              caption: 'Batalkan',
              color: Colors.transparent,
              icon: Icons.close_rounded,
              foregroundColor: Colors.red,
              onTap: () {
                status == "Keranjang" || status == "Menunggu pembayaran"
                    ? Beli.batalkan(idpesan)
                    : Get.bottomSheet(
                        tidakbisa(),
                        backgroundColor: Colors.transparent,
                      );
              },
            ),
          ],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                boxShadow1,
              ],
            ),
            padding: EdgeInsets.all(10),
            width: Get.width,
            height: 100,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Hero(
                        tag: gambar,
                        child: Image.network(
                          gambar,
                          fit: BoxFit.cover,
                        ),
                      )

                      // Image.asset(
                      //   "assets/ebook.jpg",
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                ),
                samping(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: font13,
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
                        Text(
                          "Jumlah $jum",
                          style: TextStyle(
                            fontSize: font13,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: font13,
                        color:
                            status == "Keranjang" ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget tidakbisa() {
  return Container(
    height: 180,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    padding: EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 60,
        ),
        Text(
          "Barang yang dikemas tidak dapat dibatalkan",
          style: TextStyle(
            fontSize: font13,
          ),
        ),
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: oren,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  boxShadow1,
                ]),
            child: Center(
              child: Text(
                "Oke",
                style: TextStyle(
                  fontSize: font13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

// Widget seet() {
//   return Container(
//     height: 220,
//     // padding: EdgeInsets.all(15),
//     color: Colors.transparent,
//     child:
//         // Row(
//         //   children: <Widget>[
//         //     Icon(Icons.chat),
//         //     samping(15),
//         //     Text(
//         //       "Hubungi kami",
//         //       style: TextStyle(
//         //         fontSize: font13,
//         //       ),
//         //     ),
//         //   ],
//         // ),

//         Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(
//             left: 15,
//             right: 15,
//             bottom: 15,
//           ),
//           width: Get.width,
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Text(
//             "Anda dapat melakukan pembatalan jika barang belum dalam pengiriman atau pemberitahuan dari admin",
//             style: TextStyle(
//               fontSize: font12,
//               color: Colors.grey,
//             ),
//           ),
//         ),
//         ///////////////////////////////////////////
//         ///
//         ///
//         ///
//         ///
//         Container(
//           margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               InkWell(
//                 onTap: () {
//                   // print("kap");
//                   _launch('whatsapp://send?phone=+6285735379740');
//                 },
//                 child: Container(
//                   width: Get.width,
//                   height: 40,
//                   // color: oren,
//                   child: Row(
//                     children: <Widget>[
//                       Icon(Icons.chat),
//                       samping(15),
//                       Text(
//                         "Hubungi kami",
//                         style: TextStyle(
//                           fontSize: font13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(
//                 height: 0,
//               ),
//               InkWell(
//                 onTap: () {
//                   print("kap");
//                 },
//                 child: Container(
//                   width: Get.width,
//                   height: 40,
//                   // color: oren,
//                   child: Row(
//                     children: <Widget>[
//                       Icon(Icons.close),
//                       samping(15),
//                       Text(
//                         "Batalkan pemesanan",
//                         style: TextStyle(
//                           fontSize: font13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
