import 'package:book_club/firebase_options.dart';
import 'package:book_club/service/auth.dart';
import 'package:book_club/utils/my_theme.dart';
import 'package:book_club/view/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme().buildTheme(),
      home: const Login(),
    ),
    ) ;
  }
}

