import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicplayer2/screens/starting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:musicplayer2/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp( const MaterialApp(
    title: "Music Player",
    debugShowCheckedModeBanner: false,
    home: StartingPage()
  ));
}