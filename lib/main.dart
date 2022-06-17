import 'package:cwjgram_flutter/responsive/mobile_screen_layout.dart';
import 'package:cwjgram_flutter/responsive/responsive_layout_screen.dart';
import 'package:cwjgram_flutter/responsive/web_screen_layout.dart';
import 'package:cwjgram_flutter/screens/login_screen.dart';
import 'package:cwjgram_flutter/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // if web
    await Firebase.initializeApp(
      // web API info via Firebase
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAd9gZDbWv4jXRmR3cs8lDIe-OvQwaYRlY',
        appId: '1:251914678465:web:6d6206226ab71bf4bea440',
        messagingSenderId: '251914678465',
        projectId: 'cwjgram',
        storageBucket: 'cwjgram.appspot.com',
      ),
    );
  } else {
    //if mobile
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CWJgram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(), 
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: LoginScreen(),
    );
  }
}
