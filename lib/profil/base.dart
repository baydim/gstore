// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class Base {
//   static Future<String> uploadimage(File imagefile) async {
//     try {
//       String filename = basename(imagefile.path);
//       final ref = FirebaseStorage.instance.ref().child(filename);
//       final task = ref.putFile(imagefile);
//       return await task.snapshot.ref.getDownloadURL();
//     } on FirebaseException catch (e) {
//       print(e);
//     }
//   }
// }
