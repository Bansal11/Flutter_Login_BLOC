import 'dart:async';
import 'validators.dart';

//with clause add mixins to the base class ie the extends class and then the three are added to the new class which is being made
//hence to use with clause we need to extend to the object class which is the base class of every class in dart

class Bloc extends Object with validators {
// since we are always dealing with the string type data we do not need .map() and hence we can use generics here
//  marking the feilds as private so that they dont visisble

//we need to close the sinks when we are done dart wants is and hence we create a method dispose
  final _email = StreamController<String>();
  final _password = StreamController<String>();

//  to get data from stream
//  getter are used for shortcut representaton
//declaring the type of the getter

//  we are sending the validateEmai as transsformer/filter which will give the result
//  and at last we will listen to the result
//  just like the dart practice examples
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

//to add data to sink

  Function(String) get addEmail => _email.sink.add;

  Function(String) get addPassword => _password.sink.add;

//to clean up the sink,variables, stream controllers

  dispose () {
    _email.close();
    _password.close();
  }


}
// Single global instance approach t apply the bloc
//it is best suited for small applications
//we create an instance of thr bloc and then use to access features of bloc in any othe
//file by importing the bloc dart file and calling the methods using this global bloc instance


final Bloc bloc = Bloc();

