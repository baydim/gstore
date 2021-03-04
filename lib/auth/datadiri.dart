import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/auth/widgetauth.dart';
import 'package:gstore/backend/daftardata.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';
import 'package:gstore/main.dart';

class Dir extends StatefulWidget {
  @override
  _DirState createState() => _DirState();
}

class _DirState extends State<Dir> {
  final ser = FirebaseAuth.instance.currentUser;
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: user.where('email', isEqualTo: ser.email).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data.docs == [] || snapshot.data.docs.isEmpty) {
          return Datadiri(ser.email);
        }
        if (snapshot.data.docs.isNotEmpty) {
          return B();
        }
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class Datadiri extends StatefulWidget {
  final String email;
  Datadiri(this.email);
  @override
  _DatadiriState createState() => _DatadiriState();
}

class _DatadiriState extends State<Datadiri> {
  TextEditingController nama = TextEditingController();
  TextEditingController notlp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: 40,
                  width: 40,
                ),
                Text(
                  "Data diri",
                  style: TextStyle(color: oren),
                )
              ],
            ),
          ),
          slivbawah(50),
          SliverToBoxAdapter(
            child: Column(
              children: [
                fom(
                  "Nama",
                  (value) {
                    setState(() {});
                  },
                  nama,
                  Icons.verified_user_rounded,
                  false,
                  TextInputType.text,
                  null,
                ),
                bawah(15),
                fom(
                  "Nomer telepon",
                  (value) {
                    setState(() {});
                  },
                  notlp,
                  Icons.phone,
                  false,
                  TextInputType.number,
                  null,
                ),
                bawah(15),
                fom(
                  "Alamat",
                  (value) {
                    setState(() {});
                  },
                  alamat,
                  Icons.map,
                  false,
                  TextInputType.text,
                  null,
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (nama.text.isEmpty || notlp.text.isEmpty || alamat.text.isEmpty) {
            Get.rawSnackbar(
              margin: EdgeInsets.only(bottom: 70),
              forwardAnimationCurve: Curves.elasticInOut,
              reverseAnimationCurve: Curves.elasticOut,
              backgroundColor: Colors.transparent,
              messageText: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        boxShadow1,
                      ]),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Data belum lengkap",
                    style: TextStyle(
                      fontSize: font13,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          } else {
            Datardata.daftaruser(
              nama: nama.text,
              notelp: notlp.text,
              email: widget.email,
              alamat: alamat.text,
            );
            Get.back();
          }
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
                "Lanjut",
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
    );
  }
}
