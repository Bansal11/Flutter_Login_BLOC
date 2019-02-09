import 'package:flutter/material.dart';
import '../src/screens/LoginScreen.dart';

class App extends StatelessWidget{

  build(context){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'log me in',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }

}