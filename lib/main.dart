import 'package:clothing_store_firestore_crud/src/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
    await Firebase.initializeApp();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  });

  runApp(const MyApp());
}
