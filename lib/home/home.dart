import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/fire.dart';
import 'package:gstore/cart/lacakresi/managelacak.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:gstore/css/widgetall.dart';
import 'package:gstore/home/widgethome.dart';
import 'package:gstore/detail/detail.dart';
import 'package:gstore/kelas/kelas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    "https://ecs7-p.tokopedia.net/img/cache/1208/NsjrJu/2021/1/28/d64dbb51-0c3c-468a-a89f-776443bc7f3c.jpg",
    "https://ecs7-p.tokopedia.net/img/cache/1208/NsjrJu/2021/1/28/f4eeba02-a5b3-4735-9c1c-775ac6339f85.jpg"
  ];
  final ser = FirebaseAuth.instance.currentUser;
  Barang barang = Get.put(Barang());
  ManagaeLacak _lacak = Get.put(ManagaeLacak());
  // Barang _barang = Get.put(Barang());
  // @override
  // void initState() {
  //   super.initState();
  //   _barang.sama(ser.email);
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Barang>(
        init: Barang(),
        builder: (val) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                slivapp(ser.email),
                slivbawah(10),
                SliverToBoxAdapter(
                  child: CarouselSlider.builder(
                    itemCount: images.length,
                    options: CarouselOptions(
                      height: 120,
                      autoPlay: true,
                      aspectRatio: 2.0,
                      viewportFraction: 0.92,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 400),
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: Colors.white),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        samping(15),
                        for (var a in kategori)
                          InkWell(
                            onTap: () {
                              barang.carikelas(a);
                              Get.to(Kelas(a));
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: 5, top: 5, bottom: 15),
                              padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                              decoration: BoxDecoration(
                                color: oren,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [boxShadow1],
                              ),
                              child: Text(
                                a,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: font12,
                                ),
                              ),
                            ),
                          ),
                        samping(10),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Visibility(
                    visible: val.rpl.isEmpty ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            kategori[0],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              samping(15),
                              // for (var i = 0; i < 5; i++)

                              for (var a in val.rpl)
                                InkWell(
                                  onTap: () {
                                    _lacak.getlo();
                                    barang.getdetail(a['id']);
                                    Get.to(Detail());
                                  },
                                  child: cad(
                                    0,
                                    5,
                                    15,
                                    5,
                                    a['gambar'],
                                    a['nama'],
                                    a['harga'],
                                    a['hargacoret'],
                                    a['stock'],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ///////////////////////
                // bawah(15),
                slivbawah(5),

                SliverToBoxAdapter(
                  child: Visibility(
                    visible: val.tpemesinan.isEmpty ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            kategori[1],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              samping(15),
                              for (var a in val.tpemesinan)
                                InkWell(
                                  onTap: () {
                                    _lacak.getlo();
                                    barang.getdetail(a['id']);
                                    Get.to(Detail());
                                  },
                                  child: cad(
                                    0,
                                    5,
                                    15,
                                    5,
                                    a['gambar'],
                                    a['nama'],
                                    a['harga'],
                                    a['hargacoret'],
                                    a['stock'],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                slivbawah(5),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: val.tpengelasan.isEmpty ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            kategori[2],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              samping(15),
                              for (var a in val.tpengelasan)
                                InkWell(
                                  onTap: () {
                                    _lacak.getlo();
                                    barang.getdetail(a['id']);
                                    Get.to(Detail());
                                  },
                                  child: cad(
                                    0,
                                    5,
                                    15,
                                    5,
                                    a['gambar'],
                                    a['nama'],
                                    a['harga'],
                                    a['hargacoret'],
                                    a['stock'],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                slivbawah(5),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: val.dpib.isEmpty ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            kategori[3],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              samping(15),
                              for (var a in val.dpib)
                                InkWell(
                                  onTap: () {
                                    _lacak.getlo();
                                    barang.getdetail(a['id']);
                                    Get.to(Detail());
                                  },
                                  child: cad(
                                    0,
                                    5,
                                    15,
                                    5,
                                    a['gambar'],
                                    a['nama'],
                                    a['harga'],
                                    a['hargacoret'],
                                    a['stock'],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                slivbawah(5),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: val.tbsm.isEmpty ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            kategori[4],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              samping(15),
                              for (var a in val.tbsm)
                                InkWell(
                                  onTap: () {
                                    _lacak.getlo();
                                    barang.getdetail(a['id']);
                                    Get.to(Detail());
                                  },
                                  child: cad(
                                    0,
                                    5,
                                    15,
                                    5,
                                    a['gambar'],
                                    a['nama'],
                                    a['harga'],
                                    a['hargacoret'],
                                    a['stock'],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                slivbawah(5),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: val.ei.isEmpty ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            kategori[5],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              samping(15),
                              for (var a in val.ei)
                                InkWell(
                                  onTap: () {
                                    _lacak.getlo();
                                    barang.getdetail(a['id']);
                                    Get.to(Detail());
                                  },
                                  child: cad(
                                    0,
                                    5,
                                    15,
                                    5,
                                    a['gambar'],
                                    a['nama'],
                                    a['harga'],
                                    a['hargacoret'],
                                    a['stock'],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                slivbawah(5),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: val.oi.isEmpty ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            kategori[6],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              samping(15),
                              for (var a in val.oi)
                                InkWell(
                                  onTap: () {
                                    _lacak.getlo();
                                    barang.getdetail(a['id']);
                                    Get.to(Detail());
                                  },
                                  child: cad(
                                    0,
                                    5,
                                    15,
                                    5,
                                    a['gambar'],
                                    a['nama'],
                                    a['harga'],
                                    a['hargacoret'],
                                    a['stock'],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                slivbawah(5),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: val.tptu.isEmpty ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            kategori[7],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              samping(15),
                              for (var a in val.tptu)
                                InkWell(
                                  onTap: () {
                                    _lacak.getlo();
                                    barang.getdetail(a['id']);
                                    Get.to(Detail());
                                  },
                                  child: cad(
                                    0,
                                    5,
                                    15,
                                    5,
                                    a['gambar'],
                                    a['nama'],
                                    a['harga'],
                                    a['hargacoret'],
                                    a['stock'],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                slivbawah(80)
              ],
            ),
          );
        });
  }
}
