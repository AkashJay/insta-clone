import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final formKey = GlobalKey<FormState>();
  String name, email, password;

  submit(){

    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(email);
      print(password);
      print(name);
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
                  child: TextFormField(decoration: InputDecoration(labelText: 'Name'),
                    validator: (input) => input.trim().isEmpty
                        ? 'Please enter a valid name': null,
                    onSaved: (input) =>password = input,
                    obscureText: true,
                  ),
                ),

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
                    child: Text('Sign Up', style: TextStyle(
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
                    onPressed: () =>
                        Navigator.pop(context),
                    color: Colors.lightGreen,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Back to Login',
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
