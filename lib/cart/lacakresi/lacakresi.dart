import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/cart/lacakresi/managelacak.dart';

import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';

class LacakResi extends StatefulWidget {
  final String via;
  final String resi;

  LacakResi(this.via, this.resi);
  @override
  _LacakResiState createState() => _LacakResiState();
}

class _LacakResiState extends State<LacakResi> {
  String viaa;
  ManagaeLacak _lacak = Get.put(ManagaeLacak());

  @override
  void initState() {
    if (widget.via == "J&T") {
      viaa = "jnt";
    } else {
      viaa = widget.via.toLowerCase();
    }
    _lacak.getres(viaa, widget.resi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _lacak.getlo();
        Get.back();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      boxShadow1,
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: oren,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Pelacak resi",
                    style: TextStyle(fontSize: 16, color: oren),
                  ),
                  samping(5),
                  Icon(
                    Icons.local_shipping_rounded,
                    color: oren,
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: GetBuilder<ManagaeLacak>(
          init: ManagaeLacak(),
          builder: (val) {
            return val.lo
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : val.modelRes.data.isBlank
                    ? Text("Null")
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            for (var aa in val.modelRes.data.history)
                              Container(
                                margin: EdgeInsets.all(15),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [boxShadow1],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          f.format(aa.date).split("%")[0],
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: font13,
                                          ),
                                        ),
                                        Text(
                                          f.format(aa.date).split("%")[1],
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: font13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Text(
                                      aa.desc,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        fontSize: font13,
                                      ),
                                    ),
                                    Divider(),
                                    Text(
                                      "Lokasi " + aa.location,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: font13,
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ],
                        ),
                      );
          },
        ),
      ),
    );
  }
}
