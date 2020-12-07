import 'package:ezy_scan/Sigin.dart';
import 'package:flutter/material.dart';
class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        backgroundColor: Color(0xFF5f6f2e),
        title: Text('EZY SCAN',
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child:ListTile(
                        leading: Icon(Icons.mail,
                          color: Color(0xFF9bcd9b),
                          size: 40.0,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Your Email',
                            hintStyle:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  child: Center(
                    child: Text('Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0,
                          color: Colors.white
                      ),
                    ),
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF9bcd9b),
                      borderRadius:BorderRadius.only( topLeft: Radius.circular(5),topRight: Radius.circular(5)  )
                  ),
                ),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return Home();
                  })
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
