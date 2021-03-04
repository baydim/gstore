import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color ijo = Color(0xFF13856E);
Color oren = Color(0xFFFF9934);

List<String> kategori = [
  "RPL",
  "T.Pemesinan",
  "T.Pengelasan",
  "DPIB",
  "TBSM",
  "EI",
  "OI",
  "TPTU"
];
BoxShadow boxShadow1 = BoxShadow(
  color: Colors.grey.withOpacity(0.6),
  blurRadius: 5,
);
NumberFormat forhar =
    NumberFormat.currency(locale: 'id', symbol: "Rp.", decimalDigits: 0);
double font12 = 12;
double font13 = 13;
double font14 = 14;
final f = new DateFormat('EEEE,d-MM-yyyy % hh:mm', "id_ID");
