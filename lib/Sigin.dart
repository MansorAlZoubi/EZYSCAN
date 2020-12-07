import 'package:flutter/material.dart';
import 'signup.dart';
import 'Forget Password.dart';
import 'page1.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                flex:2,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:30 ,),
                   Image.asset('Image/ezy-scan - Copy.png',width: 400,height: 350,),

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
                      child:ListTile(
                        leading: Icon(Icons.mail,
                          color: Color(0xFF9bcd9b),
                          size: 40.0,
                        ),
                        title: TextField(
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
                      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        shape: CircleBorder(),

                        leading:Icon(Icons.vpn_key_outlined,
                          color: Color(0xFF9bcd9b),
                          size: 40,
                        ) ,
                        title: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:20.0,
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
                            child: Text('Forget Password',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Password()),
                            );
                          },
                        ),
                        GestureDetector(
                          child: Center(
                            child: Text('CreateAccount',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signup()),
                            );
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              signin(),
            ],
          ),
        ),
      ),
    );
  }
}

class signin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child:Center( child: Text('Sign In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 60.0,
          ),
        ),
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFF9bcd9b),
            borderRadius:BorderRadius.only( topLeft: Radius.circular(5),topRight: Radius.circular(5)  ),

        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page()),
        );
      },

    );
  }
}