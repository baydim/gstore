import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/beli.dart';
import 'package:gstore/backend/fire.dart';
import 'package:gstore/cart/cart.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:gstore/detail/widgetdetail.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController j = TextEditingController(text: "1");
  int har;
  var d = 3;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Barang>(
      init: Barang(),
      builder: (val) {
        var a = val.detail[0];
        int harkir = a['harga'];

        TextEditingController deskr =
            TextEditingController(text: a['deskripsi']);
        // String le = a['deskripsi'];
        int st = a['stock'];
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: <Widget>[
              detapp(null, a['gambar']),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    bawah(5),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            a['nama'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          Text(
                            a['kelas'],
                            style: TextStyle(
                              fontSize: font13,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                forhar.format(
                                  a['hargacoret'],
                                ),
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: font13,
                                ),
                              ),
                              samping(7.5),
                              Text("|"),
                              samping(7.5),
                              Text(
                                forhar.format(
                                  a['harga'],
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: font14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Stock " + a['stock'].toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: font13,
                            ),
                          ),
                          bawah(15),
                          Divider(
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            scrollPhysics: NeverScrollableScrollPhysics(),
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: deskr,
                            style: TextStyle(
                              fontSize: font13,
                            ),
                            maxLines: d,
                          ),
                          // Text(
                          //   a['deskripsi'],
                          //   maxLines: d,
                          // ),

                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  d == 3 ? d = null : d = 3;
                                });
                              },
                              child: Icon(
                                d == 3
                                    ? Icons.keyboard_arrow_down_rounded
                                    : Icons.keyboard_arrow_up_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          ),

                          bawah(10),
                          Divider(
                            height: 0,
                          ),
                          bawah(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Jumlah pesanan : "),
                              Row(
                                children: <Widget>[
                                  bol(
                                    Icons.remove_rounded,
                                    () {
                                      int a = int.tryParse(j.text);

                                      setState(() {
                                        a <= 1 ? print("") : a--;
                                        har = harkir * a;
                                        j.text = a.toString();
                                      });
                                    },
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: TextField(
                                      controller: j,
                                      onChanged: (value) {
                                        setState(() {
                                          value == "" ||
                                                  value.contains("-") ||
                                                  value.contains(".") ||
                                                  value.contains(",")
                                              ? j.text = "1"
                                              : print("");
                                          int h = value == "" ||
                                                  value.contains("-") ||
                                                  value.contains(".") ||
                                                  value.contains(",")
                                              ? 1
                                              : int.tryParse(value);
                                          har = harkir * h;
                                          // print("ini value" + value);
                                          // print(j.text);
                                        });
                                      },
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: font14,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                      cursorColor: oren,
                                    ),
                                  ),
                                  bol(
                                    Icons.add_rounded,
                                    () {
                                      int a = int.tryParse(j.text);

                                      setState(() {
                                        a++;
                                        if (a == st + 1) {
                                          Get.rawSnackbar(
                                              message: "Upss stock habis");
                                        } else {
                                          har = harkir * a;
                                          j.text = a.toString();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total harga:"),
                              Text(
                                forhar.format(
                                    har == null || har == 0 ? harkir : har),
                                style: TextStyle(fontSize: font14),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              slivbawah(80),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                boxShadow1,
              ],
            ),
            height: 70,
            padding: EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                DateTime now = DateTime.now();
                // print("Keranjang");
                Beli.keranjang(
                    nambar: a['nama'],
                    alamat: val.datadiri['alamat'],
                    email: val.datadiri['email'],
                    harga: har == null ? harkir : har,
                    idbarang: a['id'],
                    jumpes: int.tryParse(j.text),
                    nama: val.datadiri['nama'],
                    notelp: val.datadiri['nomor_tlp'].toString(),
                    wak: now,
                    gambar: a['gambar']);
                Get.rawSnackbar(
                  onTap: (snack) {
                    Get.to(
                      Cart(val.datadiri['email']),
                    );
                  },
                  margin: EdgeInsets.only(bottom: 70),
                  forwardAnimationCurve: Curves.elasticInOut,
                  reverseAnimationCurve: Curves.elasticOut,
                  backgroundColor: Colors.transparent,
                  messageText: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              100), // for (var i = 0; i < 10; i++)
                          boxShadow: [
                            boxShadow1,
                          ]),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "👍  " + "Berhasil ditambahkan",
                        style: TextStyle(
                          fontSize: font13,
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                // margin: EdgeInsets.only(left: 15, right: 15),
                width: Get.width,
                height: 40,
                decoration: BoxDecoration(
                  color: oren,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [boxShadow1],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Colors.white,
                    ),
                    samping(10),
                    Text(
                      "Keranjang",
                      style: TextStyle(
                        fontSize: font14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
