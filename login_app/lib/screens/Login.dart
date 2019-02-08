import 'package:flutter/material.dart';
//imprting the validation mixin to import all its feature and use them
import '../mixins/validation_mixin.dart';
class Login extends StatefulWidget {
  createState() {
    return LoginState();
  }
}
//mentioning the mixin here
class LoginState extends State<Login> with ValidationMixin{
//  Global key is used to create reference to an entity
//  here we are refering the made up formstate entity which is nothing but
//  loginState. it is used to refer the form which is in the current state
//  and using that reference to get vlues from the text field while submiting
//  for more search the Global key in google
//  formState class is present in flutter documentation

  final formKey = GlobalKey<FormState>();

  var emailVar = '';
  var passwordVar = '';
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
// automatically form widget knows that it has text filds children and hence to validate
// the tet entered we just need to tell the form widget to validate it
      child: Form(
//        assigning the form to the global key
        key: formKey,
          child: Column(
        children: <Widget>[
          Container(margin: EdgeInsets.only(top: 50.0),),
          email(),
//          creating one line margin using container since in column layout this will be considered as an empty widget in a column
          Container(margin: EdgeInsets.only(bottom: 50.0),),
          password(),
          Container(margin: EdgeInsets.only(bottom: 50.0),),
          submit(),
        ],
      )
      ),
    );
  }

  Widget email(){

    return TextFormField(
//      onsaved do the same as validate do
      onSaved: (val){
        emailVar = val;
      },
//      providing reference to the mixin method
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'your@example.com',
      ),
      );
  }
  Widget password(){
    return TextFormField(
      onSaved: (val){
        passwordVar = val;
      },
          validator: validatePassword,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'PAssword',
      ),
    );
  }
  Widget submit(){
    return RaisedButton(
      child: Text('Submit'),
//      on pressing this button the command is snd to th form widget to validate the form entries
      onPressed: (){
//        formkey here gives the reference to the FormState
//      .current state returns the instance of current state of form state
//      .reset is the method on formstate which resests the fields

//      .validate will search for every text fields inside the form and call the fucntion validator
//      validator is responsible for looking the text field value and check whether it is correct or not

//      validate function will ask the validators if there is any problem eith the entered fileds
        if(formKey.currentState.validate()){
//          save() executes the onSaved functios in text fields
          formKey.currentState.save();
          print('$emailVar and $passwordVar');
        };

      },
      textColor: Colors.white,
      color: Colors.blue,
    );

  }
}
