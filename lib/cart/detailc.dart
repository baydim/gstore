import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/beli.dart';
import 'package:gstore/backend/fire.dart';
import 'package:gstore/cart/lacakresi/lacakresi.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:gstore/detail/widgetdetail.dart';

import 'lacakresi/managelacak.dart';

class Detailc extends StatefulWidget {
  final String idpesan;
  Detailc(this.idpesan);
  @override
  _DetailcState createState() => _DetailcState();
}

class _DetailcState extends State<Detailc> {
  TextEditingController al = TextEditingController();
  TextEditingController atsnam = TextEditingController();
  ManagaeLacak _managaeLacak = Get.put(ManagaeLacak());
  String ta;
  String nb;
  String em;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _managaeLacak.hapres();
        Get.back();
      },
      child: StreamBuilder<DocumentSnapshot>(
        stream: Beli.beli.doc(widget.idpesan).snapshots(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snap.hasData) {
            var a = snap.data.data();
            print(a.toString());
            al.text = a['alamat'];
            atsnam.text = a['atasnama'];
            em = a['email'];

            return Scaffold(
              backgroundColor: Colors.white,
              body: GetBuilder<Barang>(
                init: Barang(),
                builder: (val) {
                  var aa = val.detail[0];
                  nb = aa['nama'];
                  return CustomScrollView(
                    slivers: <Widget>[
                      detapp(a['status'], a['gambar']),
                      SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    aa['nama'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                  Text(
                                    aa['kelas'],
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
                                          aa['hargacoret'],
                                        ),
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                          fontSize: font13,
                                        ),
                                      ),
                                      samping(7.5),
                                      Text("|"),
                                      samping(7.5),
                                      Text(
                                        forhar.format(
                                          aa['harga'],
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
                                    "Stock " + aa['stock'].toString(),
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
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Jumlah pesanan : ",
                                        style: TextStyle(fontSize: font13),
                                      ),
                                      Text(
                                        a['jumpes'].toString(),
                                        style: TextStyle(
                                            fontSize: font13,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Total harga : ",
                                        style: TextStyle(fontSize: font13),
                                      ),
                                      Text(
                                        forhar.format(
                                          a['harga'],
                                        ),
                                        style: TextStyle(
                                            fontSize: font13,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  bawah(15),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 0, right: 15),
                                    // margin: EdgeInsets.only(left: 15, right: 15),
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
                                    child: TextFormField(
                                      readOnly: a['status'] != "Keranjang"
                                          ? true
                                          : false,
                                      controller: atsnam,
                                      onChanged: (value) {
                                        ta = value;
                                      },
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: font14,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Atas nama",
                                        border: InputBorder.none,
                                        prefixIcon:
                                            Icon(Icons.verified_user_rounded),
                                      ),
                                      cursorColor: oren,
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ),
                                  bawah(15),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 0, right: 15),
                                    // margin: EdgeInsets.only(left: 15, right: 15),
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
                                    child: TextFormField(
                                      readOnly: a['status'] != "Keranjang"
                                          ? true
                                          : false,
                                      controller: al,
                                      onChanged: (value) {},
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: font14,
                                      ),
                                      decoration: InputDecoration(
                                        hintText:
                                            "Rt/Rw,Jalan,Desa,Kabupaten,Provinsi",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.map),
                                      ),
                                      cursorColor: oren,
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ),
                                  bawah(15),
                                  Divider(
                                    height: 0,
                                  ),
                                  bawah(15),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Deskripsi :",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      bawah(5),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          aa['deskripsi'],
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  bawah(15),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              floatingActionButton: a['status'] == "Dikirim"
                  ? FloatingActionButton(
                      onPressed: () {
                        Get.dialog(
                          Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              height: 180,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Pengiriman via " + a['via'],
                                    style: TextStyle(
                                      fontSize: font14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nomer resi :",
                                            style: TextStyle(
                                              fontSize: font13,
                                            ),
                                          ),
                                          Text(
                                            a['resi'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: font13,
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Clipboard.setData(
                                            new ClipboardData(text: a['resi']),
                                          );
                                          Get.rawSnackbar(
                                            forwardAnimationCurve:
                                                Curves.elasticInOut,
                                            reverseAnimationCurve:
                                                Curves.elasticOut,
                                            backgroundColor: Colors.transparent,
                                            messageText: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [boxShadow1]),
                                          child: Center(
                                            child: Text(
                                              "Salin",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: font12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  bawah(2),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                      // Get.isDialogOpen == true
                                      //     ? Get.back()
                                      //     : print("haiss");
                                      Get.to(
                                        LacakResi(a['via'], a['resi']),
                                      );
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: oren,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Lacak resi",
                                          style: TextStyle(
                                            fontSize: font13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.local_shipping_rounded,
                        color: Colors.white,
                      ),
                    )
                  : SizedBox(
                      width: 0,
                      height: 0,
                    ),
              bottomNavigationBar: InkWell(
                onTap: () {
                  al.text == null ||
                          al.text.isEmpty ||
                          atsnam.text.isEmpty ||
                          atsnam.text == null
                      ? Get.rawSnackbar(
                          message: "Atas nama & Alamat tidak boleh kosong",
                          backgroundColor: Colors.red,
                          forwardAnimationCurve: Curves.elasticInOut,
                          reverseAnimationCurve: Curves.elasticOut,
                        )
                      : a['status'] == "Keranjang" ||
                              a['status'] == "Menunggu pembayaran"
                          ? Get.bottomSheet(
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Text(
                                              "Pembayaran",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(Icons.payment_rounded,
                                                color: oren)
                                          ],
                                        ),
                                        bawah(15),
                                        Text(
                                          "Untuk melakukan pembayaran anda harus mentransfer ke rekening BRI,Kami melakukan checking selama 24 jam,Jika ada kendala anda bisa menghubungi kami dipojok kanan atas.",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        bawah(15),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "0111-01-057361-50-7",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        bawah(15),
                                        Divider(
                                          height: 0,
                                        ),
                                        bawah(15),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.warning_rounded,
                                              color: Colors.red,
                                            ),
                                            samping(15),
                                            Text(
                                              "Penting",
                                              style: TextStyle(
                                                  fontSize: font14,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        bawah(10),
                                        Text(
                                          "Untuk transfer harus dengan deksripsi : ",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        Text(
                                          "Nama barang :  $nb",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        Text(
                                          "Atas nama :  " + atsnam.text,
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        Text(
                                          "Email :  $em",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        bawah(15),
                                        Divider(
                                          height: 0,
                                        ),
                                        bawah(15),
                                        Text(
                                          "Kirim foto bukti pembayaran dipojok kanan atas",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        var n = DateTime.now();
                                        Get.back();
                                        Beli.ambil(
                                          widget.idpesan,
                                          nambar: a['nambar'],
                                          alamat: al.text,
                                          email: a['email'],
                                          harga: a['harga'],
                                          idbarang: a['idbarang'],
                                          jumpes: a['jumpes'],
                                          nama: a['nama'],
                                          notelp: a['notelp'],
                                          wak: n,
                                          gambar: a['gambar'],
                                          atasnama: atsnam.text,
                                        );
                                      },
                                      child: Container(
                                        height: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: oren,
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                              ),
                              backgroundColor: Colors.transparent)

                          // Beli.ambil(widget.idpesan,
                          //     nambar: a['nambar'],
                          //     alamat: al.text,
                          //     email: a['email'],
                          //     harga: a['harga'],
                          //     idbarang: a['idbarang'],
                          //     jumpes: a['jumpes'],
                          //     nama: a['nama'],
                          //     notelp: a['notelp'],
                          //     wak: a['wak'],
                          //     gambar: a['gambar'],
                          //     atasnama: atsnam.text)
                          : Get.bottomSheet(
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Text(
                                              "Pembayaran",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(Icons.payment_rounded,
                                                color: oren)
                                          ],
                                        ),
                                        bawah(15),
                                        Text(
                                          "Untuk melakukan pembayaran anda harus mentransfer ke rekening BRI,Kami melakukan checking selama 24 jam,Jika ada kendala anda bisa menghubungi kami dipojok kanan atas.",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        bawah(15),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "0111-01-057361-50-7",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        bawah(15),
                                        Divider(
                                          height: 0,
                                        ),
                                        bawah(15),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.warning_rounded,
                                              color: Colors.red,
                                            ),
                                            samping(15),
                                            Text(
                                              "Penting",
                                              style: TextStyle(
                                                  fontSize: font14,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        bawah(10),
                                        Text(
                                          "Untuk transfer harus dengan deksripsi : ",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        Text(
                                          "Nama barang :  $nb",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        Text(
                                          "Atas nama :  " + a['atasnama'],
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        Text(
                                          "Email :  $em",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                        bawah(15),
                                        Divider(
                                          height: 0,
                                        ),
                                        bawah(15),
                                        Text(
                                          "Kirim foto bukti pembayaran dipojok kanan atas",
                                          style: TextStyle(
                                            fontSize: font13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            boxShadow: [
                                              boxShadow1,
                                            ]),
                                        child: Center(
                                          child: Text(
                                            "Kembali",
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
                              ),
                              isScrollControlled: true,
                            );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      boxShadow1,
                    ],
                  ),
                  height: 70,
                  padding: EdgeInsets.all(15),
                  child: Container(
                    // margin: EdgeInsets.only(left: 15, right: 15),
                    width: Get.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: a['status'] == "Keranjang" ? oren : Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [boxShadow1],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          a['status'] == "Keranjang"
                              ? "Bayar sekarang"
                              : a['status'],
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
          }
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
