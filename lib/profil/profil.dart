import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/auth.dart';
import 'package:gstore/backend/fire.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:gstore/profil/widgetprofil.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final ser = FirebaseAuth.instance.currentUser;
  Barang bar = Get.put(Barang());
  String imagepath;
  Masuk _masuk = Get.put(Masuk());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(back),
      backgroundColor: Colors.white,
      body: GetBuilder<Barang>(
        init: Barang(),
        builder: (val) {
          TextEditingController nama = TextEditingController(
            text: val.datadiri['nama'],
          );
          TextEditingController notlp = TextEditingController(
            text: val.datadiri['nomor_tlp'].toString(),
          );
          TextEditingController alamat = TextEditingController(
            text: val.datadiri['alamat'],
          );
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: Get.width,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200),
                            boxShadow: [
                              boxShadow1,
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child:
                                // Image.network(
                                //     "gs://toko-c6709.appspot.com/logo.png")

                                Image.asset("assets/stmj.png"),
                          ),
                        ),
                      ),
                    ),
                    bawah(50),
                    // Text(val.idmu),
                    InkWell(
                      onTap: () {
                        Get.dialog(
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: 120,
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextField(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      decoration: InputDecoration(
                                        hintText: "Nama",
                                      ),
                                      controller: nama,
                                      onChanged: (value) {
                                        setState(() {
                                          print(value);
                                        });
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        bar.upnama(nama.text);
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 35,
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        decoration: BoxDecoration(
                                          color: oren,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Simpan",
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
                          ),
                        );
                      },
                      child: m(
                        Icons.verified_user_rounded,
                        "Nama",
                        val.datadiri['nama'].toString(),
                        "Ini adalah nama anda, Kami gunakan untuk mengidentifikasi pemesanan anda",
                      ),
                    ),
                    bawah(30),
                    m(
                      Icons.account_circle_rounded,
                      "Email",
                      ser.email == null ? "Example@gmail.com" : ser.email,
                      "Ini adalah akun email anda, jangan berikan kepada sesama user untuk keamanan",
                    ),
                    bawah(30),
                    InkWell(
                      onTap: () {
                        Get.dialog(
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: 120,
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextField(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Nomor telepon",
                                      ),
                                      controller: notlp,
                                      onChanged: (value) {
                                        setState(() {
                                          print(value);
                                        });
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        bar.uptlp(notlp.text);
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 35,
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        decoration: BoxDecoration(
                                          color: oren,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Simpan",
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
                          ),
                        );
                      },
                      child: m(
                        Icons.phone,
                        "Telepon",
                        // "hiohiods",
                        val.datadiri['nomor_tlp'].toString(),
                        "Nomer telepon digunakan untuk menghubungi jika ada kendala atau pertanyaan",
                      ),
                    ),
                    bawah(30),
                    InkWell(
                      onTap: () {
                        Get.dialog(
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: 120,
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextField(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Rt/Rw,Jalan,Desa,Kabupaten,Provinsi",
                                      ),
                                      controller: alamat,
                                      onChanged: (value) {
                                        setState(() {
                                          print(value);
                                        });
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        bar.upalam(alamat.text);
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 35,
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        decoration: BoxDecoration(
                                          color: oren,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Simpan",
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
                          ),
                        );
                      },
                      child: m(
                        Icons.map_rounded,
                        "Alamat",
                        // "hiohiods",
                        val.datadiri['alamat'].toString(),
                        "Ini adalah alamat anda, tetapi ada dapat memasukan alamat lain saat pemesanan",
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: TextButton(
                  onPressed: () {
                    _masuk.out();
                  },
                  child: Text(
                    "Keluar",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: font13,
                    ),
                  ),
                ),
              ),
              slivbawah(80),
            ],
          );
        },
      ),
    );
  }
}

// Future getimage() async {
//   return await ImagePicker().getImage(source: ImageSource.gallery);
// }
