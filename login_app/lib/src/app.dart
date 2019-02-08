import 'package:flutter/material.dart';
import '../screens/Login.dart';

class App extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hello',
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}