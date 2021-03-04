// To parse this JSON data, do
//
//     final modelDetail = modelDetailFromJson(jsonString);

import 'dart:convert';

ModelDetail modelDetailFromJson(String str) => ModelDetail.fromJson(json.decode(str));

String modelDetailToJson(ModelDetail data) => json.encode(data.toJson());

class ModelDetail {
    ModelDetail({
        this.nama,
        this.harga,
        this.kelas,
        this.hargacoret,
        this.createAt,
        this.stock,
        this.gambar,
    });

    String nama;
    int harga;
    String kelas;
    String hargacoret;
    String createAt;
    int stock;
    String gambar;

    factory ModelDetail.fromJson(Map<String, dynamic> json) => ModelDetail(
        nama: json["nama"],
        harga: json["harga"],
        kelas: json["kelas"],
        hargacoret: json["hargacoret"],
        createAt: json["create_at"],
        stock: json["stock"],
        gambar: json["gambar"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "harga": harga,
        "kelas": kelas,
        "hargacoret": hargacoret,
        "create_at": createAt,
        "stock": stock,
        "gambar": gambar,
    };
}


