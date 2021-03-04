import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/fire.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:gstore/css/widgetall.dart';
import 'package:gstore/detail/detail.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Kelas extends StatefulWidget {
  final String kelas;
  Kelas(this.kelas);
  @override
  _KelasState createState() => _KelasState();
}

class _KelasState extends State<Kelas> {
  Barang _barang = Get.put(Barang());

  // @override
  // void initState() {
  //   super.initState();

  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Barang>(
      init: Barang(),
      builder: (val) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
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
                        // _barang.carikelas(widget.kelas);
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
                          widget.kelas,
                          style: TextStyle(fontSize: 16, color: oren),
                        ),
                        samping(5),
                        Icon(
                          Icons.shopping_bag_rounded,
                          color: oren,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: val.kela.isEmpty
                    ? Center(
                        child: Text(
                          "Belum ada barang",
                          style: TextStyle(
                            fontSize: font13,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ResponsiveGridRow(
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            for (var a in val.kela)
                              ResponsiveGridCol(
                                xs: 6,
                                md: 3,
                                child: InkWell(
                                  onTap: () {
                                    _barang.getdetail(a['id']);
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
              )
            ],
          ),
        );
      },
    );
  }
}
