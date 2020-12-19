import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'Forget Password.dart';
import 'page1.dart';
import 'auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Auth auth = new Auth();

  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();

  showAlertDialog(BuildContext context, String title, String message) {
    final firstWhitespace = title.indexOf(' ');
    title = title.substring(firstWhitespace);
    message = message.substring(firstWhitespace);

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'Image/ezy-scan - Copy.png',
                        width: 400,
                        height: 350,
                      ),

                      // Text('EZY SCAN',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 50.0,
                      //     color: Colors.white54,
                      //   ),
                      // ),
                      // SizedBox(height: 80,),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.mail,
                            color: Color(0xFF9bcd9b),
                            size: 40.0,
                          ),
                          title: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Your Email',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          shape: CircleBorder(),
                          leading: Icon(
                            Icons.vpn_key_outlined,
                            color: Color(0xFF9bcd9b),
                            size: 40,
                          ),
                          title: TextField(
                            obscureText: true,
                            controller: password,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            child: Center(
                              child: Text(
                                'Forget Password',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Password()),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Center(
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUp()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              signin(() async {
                try {
                  User user =
                      (await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  ))
                          .user;
                  if (user != null) {
                    if (user.emailVerified)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => page()),
                      );
                    else
                      showAlertDialog(context, "Please verify your email", "Check your email address to verify your email.");
                  }
                } catch (e) {
                  print(e);
                  email.text = "";
                  password.text = "";
                  showAlertDialog(context, e.toString(), e.toString());
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class signin extends StatelessWidget {
  signin(this.onTap);
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        child: Container(
           height: MediaQuery.of(context).size.height * 0.10,
          child: Center(
            child: Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF9bcd9b),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
        ),
        onTap: this.onTap);
  }
}
