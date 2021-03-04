import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Masuk extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  String msg;

  signin(String email, String pass) async {
    msg = null;
    try {
      final res =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = res.user;

      // Get.bottomSheet(
      //   Text(user.email),
      //   backgroundColor: Colors.white,
      // );
      return user;
    } on FirebaseAuthException catch (e) {
      Get.rawSnackbar(
        message: e.message,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.red,
        overlayColor: Colors.white,
      );
      return null;
    } catch (e) {
      print(e);
    }

    update();
  }

  daftar(String email, String pass) async {
    try {
      final res = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User user = res.user;
      Get.back();
      return user;
    } on FirebaseAuthException catch (e) {
      Get.rawSnackbar(
        message: e.message,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.red,
        overlayColor: Colors.white,
      );
    } catch (e) {
      print(e);
    }
    update();
  }

  void out() {
    auth.signOut();
    update();
  }

  //////////////////////////////////
}
