// A mixin is a method by which we can copy paste the methods of the mixin into where the mixin is called
//hence it can be reused in various places

import 'package:flutter/material.dart';

class ValidationMixin {
  String validateEmail (String val) {
//        retrun null if valid string with error message
    if (!val.contains('@')) {
      return 'enter valid email address';
    }
    return null;
  }

  String validatePassword (String val) {
    if (val.length < 4) {
      return 'enter valid password';
    }
    return null;
  }
}
