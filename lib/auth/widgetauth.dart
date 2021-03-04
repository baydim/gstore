import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/css/css.dart';

Widget fom(String nama, Function f, TextEditingController tc, IconData iconData,
    bool rhs, TextInputType textInputType, Widget suf) {
  return Container(
    margin: EdgeInsets.only(left: 15, right: 15),
    padding: EdgeInsets.only(left: 0, right: suf == null ? 15 : 0),
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
      controller: tc,
      onChanged: f,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: font14,
      ),
      decoration: InputDecoration(
        hintText:
            nama == "Alamat" ? "Rt/Rw,Jalan,Desa,Kabupaten,Provinsi" : nama,
        border: InputBorder.none,
        prefixIcon: Icon(
          iconData,
        ),
        suffixIcon: suf == null ? null : suf,
      ),
      cursorColor: oren,
      obscureText: rhs,
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.sentences,
    ),
  );
}
