import 'package:flutter/material.dart';
import 'package:flutter_app/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {

  static final String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //To setele validation for the form
  final formKey = GlobalKey<FormState>();
  String email, password;

  submit(){

    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(email);
      print(password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Zonegram',
            style: TextStyle(fontFamily: 'Billabong',
                fontSize: 50.0),),

          Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0
                  ),
                  child: TextFormField(decoration: InputDecoration(labelText: 'Email'),
                    validator: (input) => !input.contains('@') ? 'Please enter a valid email' : null,
                    onSaved: (input) =>email = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0
                  ),
                  child: TextFormField(decoration: InputDecoration(labelText: 'Password'),
                    validator: (input) => input.length < 6
                      ? 'Must be at least 6 characters': null,
                    onSaved: (input) =>password = input,
                    obscureText: true,
                  ),
                ),

                SizedBox(height: 20.0,),
                Container(
                  width: 250.0,
                  child: FlatButton(
                    onPressed: submit,
                    color: Colors.lightGreen,
                    padding: EdgeInsets.all(10.0),
                    child: Text('Login', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  width: 250.0,
                  child: FlatButton(
                    onPressed: () => Navigator.pushNamed(context, SignupScreen.id),
                    color: Colors.lightGreen,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Go to Signup',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
