import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'registed.dart';
import 'collectionfunction.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: non_constant_identifier_names
  TextEditingController email_user = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController password_user = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                buildButtonlogin('Login'),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: email_user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password_user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green[500],
                      child: Text('Login'),
                      onPressed: () {
                        Login_user();
                        // print(email_user.text);
                        // print(password_user.text);
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('New Here?'),
                    FlatButton(
                      textColor: Colors.green[500],
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegiterPage();
                        }));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
              ],
            )));
  }

  // ignore: non_constant_identifier_names
  Future<void> Login_user() async {
    // ignore: non_constant_identifier_names
    FirebaseAuth firebaseAuth_login = FirebaseAuth.instance;
    String _email = email_user.text.trim();
    String _password = password_user.text.trim();
    await firebaseAuth_login
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((response) {
      //print('Authen Success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      print('email or password is not match');
    });
  }
}
