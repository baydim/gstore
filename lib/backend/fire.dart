import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/model/modelDetail.dart';
import 'package:gstore/css/css.dart';

class Barang extends GetxController {
  final ser = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    sama(ser.email);
  }

  CollectionReference barang = FirebaseFirestore.instance.collection('barang');
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  ModelDetail modelDet;
  String idmu;
  List data = [];
  List temu = [];
  List detail = [];
  List kela = [];
  Map datadiri;
  bool ada = true;
  /////caribarang
  void carikelas(String kel) {
    kela.clear();
    kela = data
        .where((element) => element.toString().contains(kel.toString()))
        .toList();
    // print(temu);

    update();
  }

  void caribarang(String cari) {
    // temu.clear();
    temu = data
        .where((element) => element.toString().contains(cari.toString()))
        .toList();
    // print(temu);

    update();
  }

///////dapatbarang
  Stream<QuerySnapshot> getbarang() {
    data.clear();
    barang.snapshots().listen(
      (querySnapshot) {
        // int jum = querySnapshot.docs.length;
        data.clear();
        querySnapshot.docs.forEach(
          (res) {
            data.add(
              {
                'id': res.id,
                'create_at': res.data()['create_at'],
                'deskripsi': res.data()['deskripsi'],
                'gambar': res.data()['gambar'],
                'harga': res.data()['harga'],
                'hargacoret': res.data()['hargacoret'],
                'kelas': res.data()['kelas'],
                'nama': res.data()['nama'],
                'stock': res.data()['stock'],
              },
            );
            getrpl();
            getpe();
            gettpeng();
            getdpib();
            getbsm();
            getei();
            getoi();
            gettptu();
          },
        );
      },
    );
    // print("dapat data");
    update();
  }

  List rpl = [];
  void getrpl() async {
    rpl.clear();
    rpl = data
        .where((element) => element.toString().contains(kategori[0].toString()))
        .toList();
    update();
  }

  List tpemesinan = [];
  void getpe() async {
    tpemesinan.clear();
    
    tpemesinan = data
        .where((element) => element.toString().contains(kategori[1].toString()))
        .toList();
    update();
  }

  List tpengelasan = [];
  void gettpeng() async {
    tpengelasan.clear();
    tpengelasan = data
        .where((element) => element.toString().contains(kategori[2].toString()))
        .toList();
    update();
  }

  List dpib = [];
  void getdpib() async {
    dpib.clear();
    dpib = data
        .where((element) => element.toString().contains(kategori[3].toString()))
        .toList();
    update();
  }

  List tbsm = [];
  void getbsm() async {
    tbsm.clear();
    tbsm = data
        .where((element) => element.toString().contains(kategori[4].toString()))
        .toList();
    update();
  }

  List ei = [];
  void getei() async {
    ei.clear();
    ei = data
        .where((element) => element.toString().contains(kategori[5].toString()))
        .toList();
    update();
  }

  List oi = [];
  void getoi() async {
    oi.clear();
    oi = data
        .where((element) => element.toString().contains(kategori[6].toString()))
        .toList();
    update();
  }

  List tptu = [];
  void gettptu() async {
    tptu.clear();
    tptu = data
        .where((element) => element.toString().contains(kategori[7].toString()))
        .toList();
    update();
  }

  ///getdetail
  void getdetail(String id) async {
    detail.clear();
    detail = data
        .where((element) => element.toString().contains(id.toString()))
        .toList();

    update();
  }

  ////////////////
  Stream<QuerySnapshot> sama(String email) {
    // print("tes");
    user.where("email", isEqualTo: email).snapshots().listen(
      (querySnapshot) {
        querySnapshot.docs.isEmpty
            ? ada = false
            : querySnapshot.docs.forEach(
                (res) {
                  ada = true;
                  idmu = res.id;
                  datadiri = res.data();
                  print("dapat");
                },
              );
        update();
      },
    );
    update();
  }

  void upnama(String nama) async {
    await user.doc(idmu).update({'nama': nama});
  }

  void uptlp(String tlp) async {
    await user.doc(idmu).update({'nomor_tlp': int.tryParse(tlp)});
  }

  void upalam(String alamat) async {
    await user.doc(idmu).update({'alamat': alamat});
  }
}
