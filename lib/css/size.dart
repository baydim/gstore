import 'package:flutter/material.dart';

Widget bawah(double height) {
  return SizedBox(
    height: height,
  );
}

Widget samping(double width) {
  return SizedBox(
    width: width,
  );
}

Widget slivbawah(double height) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: height,
    ),
  );
}
