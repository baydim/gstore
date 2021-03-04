import 'package:cloud_firestore/cloud_firestore.dart';

class Beli {
  static CollectionReference beli =
      FirebaseFirestore.instance.collection('beli');

  static Future<void> batalkan(String idpesan) async {
    await beli.doc(idpesan).delete();
  }

  static Future<void> keranjang({
    String nambar,
    String alamat,
    String email,
    int harga,
    String idbarang,
    int jumpes,
    String nama,
    String notelp,
    DateTime wak,
    String gambar,
  }) async {
    await beli.add({
      'nambar': nambar,
      'alamat': alamat,
      'email': email,
      'harga': harga,
      'idbarang': idbarang,
      'jumpes': jumpes,
      'nama': nama,
      'notelp': notelp,
      'status': "Keranjang",
      'wak': wak,
      'gambar': gambar,
      'atasnama': null,
      'resi': '',
      'via': ''
    });
  }

  static Future<void> ambil(
    String id, {
    String nambar,
    String alamat,
    String email,
    int harga,
    String idbarang,
    int jumpes,
    String nama,
    String notelp,
    DateTime wak,
    String gambar,
    String atasnama,
  }) async {
    await beli.doc(id).set({
      'nambar': nambar,
      'alamat': alamat,
      'email': email,
      'harga': harga,
      'idbarang': idbarang,
      'jumpes': jumpes,
      'nama': nama,
      'notelp': notelp,
      'status': "Menunggu pembayaran",
      'wak': wak,
      'gambar': gambar,
      'atasnama': atasnama,
      'resi': '',
      'via': ''
    });
  }
}
