import 'package:flutter/material.dart';
import 'package:team_project/Sections/home.dart';
import 'package:team_project/auth/login.dart';
// import 'package:team_project/auth/loginwithback.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Login(),
      initialRoute: "/",
      routes: {
        "login": (context) => const Login(),
        "home": (context) => const Home()
      },
    );
  }
}
