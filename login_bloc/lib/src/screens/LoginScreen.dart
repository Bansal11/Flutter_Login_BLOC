import 'package:flutter/material.dart';
import '../Bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
//    accssing the methods in bloc usin the global instance of the bloc
//  bloc.addEmial etc
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailW(),
          passwordW(),
          Container(
            margin: EdgeInsets.all(20.0),
          ),
          submitButtonW(),
        ],
      ),
    );
  }

  Widget emailW() {
//    streamm builder is aa special widgetwhich connects stream with flutter
//  everytime a new data coes through the stream it rerenders the widget it holds inside
    return StreamBuilder(
      stream: bloc.email,
//    snapshot contains the value of data of the new data came accross the stream
      builder: (context, snapshot) {
        return TextField(
//        wiring the on changed property so that whener the email is changed by user
//      it will add it to the sink
//      we provided a reference tot he boc method ie addEmail
          onChanged: bloc.addEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'your@example.com',
            labelText: 'Email',
//            getting the error object from thr snapsohot
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordW() {
    return StreamBuilder(
        stream: bloc.password,
        builder: (conttext, snapshot) {
          return TextField(
            onChanged: bloc.addPassword,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'PAssword',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget submitButtonW() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () => null,
    );
  }
}
