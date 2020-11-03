  import 'package:flutter/material.dart';
  import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;//ต้องทำการimportเข้ามาเพื่อใช้

Container buildButtonlogin(var textinput) {
    return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(10),
    child: Text(
      textinput,
      style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w500,
          fontSize: 30),
    ));
  }
  Function asa(){
    firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instance;
  }