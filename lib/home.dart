import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectlogin/shopping.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Shopping(),
    );
  }
}
