import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/beli.dart';
import 'package:gstore/backend/fire.dart';
import 'package:gstore/cart/detailc.dart';
import 'package:gstore/cart/widgetcart.dart';
import 'package:gstore/css/size.dart';

import 'lacakresi/managelacak.dart';

class Cart extends StatefulWidget {
  final String email;
  Cart(this.email);
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Barang _barang = Get.put(Barang());
  ManagaeLacak _managaeLacak = Get.put(ManagaeLacak());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          sliv(_managaeLacak.hapres()),
          SliverToBoxAdapter(
            child: StreamBuilder<QuerySnapshot>(
              stream: Beli.beli
                  .where('email', isEqualTo: widget.email)
                  .orderBy('wak', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: Text("Terjadi kesalahan"),
                    ),
                  );
                }
                if (snapshot.data.docs.isEmpty) {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: Text("Anda belum pesan apaun"),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> a = snapshot.data.docs;

                  return Column(
                    children: [
                      for (var b in a)
                        InkWell(
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            _managaeLacak.getlo();
                            _barang.getdetail(b['idbarang']);
                            Get.to(
                              Detailc(b.id),
                              transition: Transition.noTransition,
                            );
                          },
                          child: list(
                            b['wak'],
                            b['nambar'],
                            b['harga'],
                            b['jumpes'],
                            b['status'],
                            b.id,
                            b['gambar'],
                          ),
                        ),
                    ],
                  );
                }
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),

          // InkWell(
          //   highlightColor: Colors.transparent,
          //   hoverColor: Colors.transparent,
          //   splashColor: Colors.transparent,
          //   onTap: () => Get.to(
          //     DetailCart(),
          //     transition: Transition.noTransition,
          //   ),
          //   child: list(),
          // ),

          slivbawah(80)
        ],
      ),
    );
  }
}
