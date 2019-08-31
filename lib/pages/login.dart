import 'package:flutter/material.dart';

import 'package:demo_login/pages/home.dart';
import 'package:demo_login/custom_widgets/curvy_background.dart';
import 'package:demo_login/custom_widgets/gradient_button.dart';
import 'package:demo_login/custom_widgets/form_input_field.dart';
import 'package:demo_login/utils/authentication.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CurvyBackground(),
          Login(),
        ],
      ),
    );
  }
}

// Used gradient colour
const List<Color> strongBliss = [
  Color(0xfff78ca0),
  Color(0xfff9748f),
  Color(0xfffd868c),
  Color(0xfffe9a8b),
];

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  String _password;
  String _validUser = '';
  String _signInButtonText = 'Sign In';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // This padding brings down the form input fields below the logo.
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.6),
        ),
        // It contains the form fields and buttons.
        Form(
          key: _formkey,
          autovalidate: _autoValidate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Header for Email input field
              Padding(
                padding: EdgeInsets.only(left: 40, bottom: 10),
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 16, color: Color(0xff999a9a)),
                ),
              ),
              // Email Input field
              FormInputField(
                hintText: 'your@email.com',
                onSaved: (String email) {
                  _email = email;
                },
                validator: _validateEmail,
              ),
              // Header for Password input field
              Padding(
                padding: EdgeInsets.only(left: 40, bottom: 10),
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 16, color: Color(0xff999a9a)),
                ),
              ),
              // Password input field
              FormInputField(
                obscureText: true,
                hintText: 'yourPassword',
                onSaved: (String password) {
                  _password = password;
                },
                validator: _validatePassword,
              ),
              Text(
                '  $_validUser',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 10.0,
              ),
              // Signin button
              Container(
                alignment: Alignment.center,
                child: GradientButton(
                  height: 40.0,
                  width: 200.0,
                  radius: 20.0,
                  gradient: LinearGradient(
                    colors: strongBliss,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  child: Text(
                    _signInButtonText,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  onPressed: _validateInputs,
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              // Sign up buttom
              Container(
                alignment: Alignment.center,
                child: GradientButton(
                  height: 40.0,
                  width: 200.0,
                  radius: 20.0,
                  gradient: LinearGradient(
                    colors: strongBliss,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  child: Text(
                    'Not a user yet?',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  onPressed: () {
                    showSnackBar();
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 20),
            child: Container(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  showSnackBar();
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xfff78ca0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _validateEmail(String s) {
    // pattern to validate email id
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (s.isEmpty || !regex.hasMatch(s))
      return 'Invalid email';
    else
      return null;
  }

  String _validatePassword(String s) {
    if (s.isEmpty || s.length < 6)
      return 'Password too short.';
    else
      return null;
  }

  void _validateInputs() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      setState(() {
        _signInButtonText = 'Please Wait...';
      });
      Map<String, dynamic> m =
          await Authenticator.authenticate(_email, _password);
      if (m == null || m.isEmpty)
        setState(() {
          _validUser = '* Invalid user';
          _signInButtonText = 'Sign In';
        });
      else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(
              user: m,
            ),
          ),
        );
      }
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void showSnackBar() {
    SnackBar snackbar = SnackBar(content: Text('Function not available yet.'));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
