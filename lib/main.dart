import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gstore/auth/datadiri.dart';
import 'package:gstore/auth/login/login.dart';
import 'package:gstore/backend/fire.dart';
import 'package:gstore/cari/cari.dart';
import 'package:gstore/cart/lacakresi/managelacak.dart';
import 'package:gstore/css/css.dart';
import 'package:gstore/home/hohe.dart';
import 'package:gstore/home/home.dart';
import 'package:gstore/profil/profil.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white, // status bar color
        // statusBarIconBrightness: Brightness.dark, // status bar icons' color
        // systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      title: "Gstore",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'm',
        primaryColor: oren,
        accentColor: oren,
      ),
      home: Wra(),
    );
  }
}

class Wra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData || snapshot.data != null) {
          return Dir();
        }
        return Login();
      },
    );
  }
}

class B extends StatefulWidget {
  @override
  _BState createState() => _BState();
}

class _BState extends State<B> {
  PageController p = PageController(initialPage: 0, keepPage: true);
  Barang barang = Get.put(Barang());
  ManagaeLacak _lacak = Get.put(ManagaeLacak());
  int hlm = 0;
  @override
  void initState() {
    super.initState();
    barang.getbarang();
    _lacak.getk();
  }

  @override
  Widget build(BuildContext context) {
    // final ser = FirebaseAuth.instance.currentUser;
    // Barang _barang = Get.put(Barang());
    // @override
    // void initState() {
    //   super.initState();
    //   _barang.sama(ser.email);
    // }
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(
        FocusNode(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          onPageChanged: (value) {
            setState(() {
              hlm = value;
            });
          },
          controller: p,
          children: [
            Home(),
            Cari(),
            Profil(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 57,
          // color: Colors.green,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 5,
              ),
            ],
          ),
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: BottomNavigationBar(
              // backgroundColor: Colors.red,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              selectedItemColor: oren,
              unselectedItemColor: Colors.grey,
              currentIndex: hlm,
              onTap: (value) {
                setState(() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  hlm = value;
                  p.animateToPage(value,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_rounded),
                  label: "Cari",
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.bookmark_rounded),
                //   label: "Simpan",
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  label: "Profil",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
