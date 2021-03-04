import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstore/auth/daftar/daftar.dart';
import 'package:gstore/auth/widgetauth.dart';
import 'package:gstore/backend/auth.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/css/size.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Masuk _masuk = Get.put(Masuk());
  TextEditingController em = TextEditingController();
  TextEditingController pw = TextEditingController();
  bool hat = true;

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   // Create a new credential
  //   final GoogleAuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              toolbarHeight: 20,
              backgroundColor: Colors.white,
              elevation: 0,
              forceElevated: false,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: Get.width / 2,
                height: Get.width / 2,
                child: Hero(
                  tag: "z",
                  child: Image.asset(
                    "assets/gandini 1.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Gandini",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " Store",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Waralaba bisnis SMKN 1 JENANGAN",
                    style: TextStyle(
                      fontSize: font13,
                      color: Colors.grey,
                    ),
                  ),
                  bawah(50),
                  fom(
                    "Email",
                    (value) {
                      setState(() {});
                    },
                    em,
                    Icons.account_circle_rounded,
                    false,
                    TextInputType.emailAddress,
                    null,
                  ),
                  bawah(15),
                  fom(
                    "Password",
                    (value) {
                      setState(() {});
                    },
                    pw,
                    Icons.lock_rounded,
                    hat,
                    TextInputType.visiblePassword,
                    InkWell(
                      onTap: () {
                        setState(() {
                          !hat ? hat = true : hat = false;
                        });
                      },
                      child: Icon(
                        !hat
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                      ),
                    ),
                  ),
                  bawah(15),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(Daftar(),
                          isDismissible: false,
                          isScrollControlled: true,
                          ignoreSafeArea: true);
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Belum pernah kesini ya ?",
                            style:
                                TextStyle(fontSize: font13, color: Colors.grey),
                          ),
                          TextSpan(
                            text: " Daftar sini",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: font13,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  bawah(15),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                    height: 0,
                  ),
                  bawah(15),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(100),
                  //     boxShadow: [boxShadow1],
                  //   ),
                  //   width: 35,
                  //   height: 35,
                  //   padding: EdgeInsets.all(5),
                  //   child: ClipRRect(
                  //     child: Image.asset("assets/g.png"),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          print("happp");
          _masuk.signin(em.text, pw.text);
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
                "Masuk",
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
