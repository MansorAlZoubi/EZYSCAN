import 'package:ezy_scan/Sigin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'auth.dart';
const kCnactiveCardcolor=Color(0xFF5f6f2e);
const kActiveCardColour=Color(0xFF9bcd9b);
const kLabelTextStyle=TextStyle(
  fontSize: 18.0,
  color: Color(0xFF014133),
);
enum Gender{
  male,
  female,
}
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Auth auth = new Auth();

  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();

  Gender oopGender;

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
     // resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        backgroundColor: Color(0xFF5f6f2e),

        title: Text('EZY SCAN',),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('Image/ezy-scan - Copy.png',height: MediaQuery.of(context).size.width*0.6,),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.01,horizontal:MediaQuery.of(context).size.width*0.07),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*10.0),
                      ),
                      child: ListTile(
                        leading:Icon(FontAwesomeIcons.heartbeat,
                          color: Color(0xFF9bcd9b),
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'First Name',
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
                      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.01,horizontal:MediaQuery.of(context).size.width*0.07),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*10.0),
                      ),
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.heart,
                          color: Color(0xFF9bcd9b),
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Last Name',
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
                      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.01,horizontal:MediaQuery.of(context).size.width*0.07),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*10.0),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.mail,
                          color: Color(0xFF9bcd9b),
                        ),
                        title: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your Email',
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
                      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.01,horizontal:MediaQuery.of(context).size.width*0.07),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*10.0),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.vpn_key_outlined,
                          color: Color(0xFF9bcd9b),
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


                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(child:ReusableCard(
                            onPressed: (){
                              setState(() {
                                oopGender=Gender.male;
                              });
                            },
                            color:oopGender==Gender.male ? kActiveCardColour:kCnactiveCardcolor,

                            cardChild:IconContent(
                              icon: FontAwesomeIcons.mars,
                              labl: 'Male',
                            ),
                          ) ,
                          ),
                          Expanded(child:ReusableCard(
                            onPressed: (){
                              setState(() {
                                oopGender=Gender.female;
                              });
                            },
                            color:oopGender==Gender.female ? kActiveCardColour:kCnactiveCardcolor,
                            cardChild:IconContent(
                              icon: FontAwesomeIcons.venus,
                              labl: 'Female',
                            ),
                          ) ,
                          ),
                        ],
                      ),
                    ),


                  ],

                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.10,
                  child:Center(
                    child: Text('Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF9bcd9b),
                      borderRadius:BorderRadius.only( topLeft: Radius.circular(MediaQuery.of(context).size.width*0.010),topRight: Radius.circular(MediaQuery.of(context).size.width*0.010)  )
                  ),
                ),
                onTap: () async {
                  try {
                    User user =
                        (await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        )).user;
                    user.sendEmailVerification();
                    if (user != null) {
                      Navigator.pop(context);
                    }
                  }
                  catch (e) {
                    print(e);
                    email.text = "";
                    password.text = "";
                    showAlertDialog(context, e.toString(), e.toString());
                  }
                }

            ),
          ],
        ),
      ),
    );
  }
}


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color,this.cardChild,this.onPressed});
  final Color color;
  final Widget cardChild;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
        decoration: BoxDecoration(
          color:color ,
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*10.0),
        ),
      ),
    );
  }
}
class IconContent extends StatelessWidget {
  IconContent({this.icon,this.labl});
  final IconData icon;
  final String labl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
          size: 50.0,
        ),
        Text(labl,style:kLabelTextStyle,
        )
      ],
    );
  }
}