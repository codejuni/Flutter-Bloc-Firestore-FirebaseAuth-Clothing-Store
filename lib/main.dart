import 'package:clothing_store_firestore_crud/src/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  // Ensure Flutter is initialized and add a post-frame callback
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Set preferred orientations to portrait up and portrait down
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  });

  // Run the application
  runApp(const MyApp());
}
