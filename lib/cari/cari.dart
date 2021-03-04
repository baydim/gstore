import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/fire.dart';
import 'package:gstore/cari/widgetcari.dart';
import 'package:gstore/cart/lacakresi/managelacak.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:gstore/css/widgetall.dart';
import 'package:gstore/detail/detail.dart';
import 'package:gstore/kelas/kelas.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Cari extends StatefulWidget {
  @override
  _CariState createState() => _CariState();
}

class _CariState extends State<Cari> {
  Barang barang = Get.put(Barang());
  ManagaeLacak _lacak = Get.put(ManagaeLacak());
  bool vis = true;
  TextEditingController res = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Barang>(
      init: Barang(),
      builder: (val) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(
              FocusNode(),
            ),
            // onHorizontalDragDown: (details) {
            //   FocusScope.of(context).requestFocus(FocusNode());
            //   barang.getbarang();
            // },
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                appcari(
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: res,
                    onChanged: (value) {
                      barang.caribarang(value);
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: font14,
                    ),
                    decoration: InputDecoration(
                      hintText: "Cari barang",
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search_rounded),
                    ),
                    cursorColor: oren,
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
//////////////////////////////////////
                SliverToBoxAdapter(
                  child: res.text.length != 0 || res.text.isNotEmpty
                      ? val.temu == [] || val.temu.isEmpty
                          ? Center(
                              child: Text("Barang tidak ditemukan"),
                            )
                          : Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: ResponsiveGridRow(
                                // crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  for (var a in val.temu)
                                    ResponsiveGridCol(
                                      xs: 6,
                                      md: 3,
                                      child: InkWell(
                                        onTap: () {
                                          _lacak.getlo();
                                          barang.getdetail(a['id']);
                                          Get.to(Detail());
                                        },
                                        child: cad(
                                          7,
                                          7,
                                          7,
                                          7,
                                          a['gambar'],
                                          a['nama'],
                                          a['harga'],
                                          a['hargacoret'],
                                          a['stock'],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                      : Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: ResponsiveGridRow(
                            // crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              for (var a in val.data)
                                ResponsiveGridCol(
                                  xs: 6,
                                  md: 3,
                                  child: InkWell(
                                    onTap: () {
                                      _lacak.getlo();
                                      barang.getdetail(a['id']);
                                      Get.to(Detail());
                                    },
                                    child: cad(
                                      7,
                                      7,
                                      7,
                                      7,
                                      a['gambar'],
                                      a['nama'],
                                      a['harga'],
                                      a['hargacoret'],
                                      a['stock'],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                ),

                slivbawah(80)
              ],
            ),
          ),
        );
      },
    );
  }
}
