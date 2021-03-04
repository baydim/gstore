import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/backend/fire.dart';

class Hohe extends StatefulWidget {
  @override
  _HoheState createState() => _HoheState();
}

class _HoheState extends State<Hohe> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<Barang>(
      init: Barang(),
      builder: (val) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Column(
                      children: [Text(val.rpl.toString()), Divider()],
                    ),
                    Column(
                      children: [Text(val.tpemesinan.toString()), Divider()],
                    ),
                    Column(
                      children: [Text(val.tpengelasan.toString()), Divider()],
                    ),
                    Column(
                      children: [Text(val.dpib.toString()), Divider()],
                    ),
                    Column(
                      children: [Text(val.tbsm.toString()), Divider()],
                    ),
                    Column(
                      children: [Text(val.ei.toString()), Divider()],
                    ),
                    Column(
                      children: [Text(val.oi.toString()), Divider()],
                    ),
                    Column(
                      children: [Text(val.tptu.toString()), Divider()],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
