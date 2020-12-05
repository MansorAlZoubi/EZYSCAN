import 'package:ezy_scan/Sigin.dart';
import 'package:flutter/material.dart';
class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5f6f2e),
        title: Text('EZY SCAN',
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Your Code',
                            hintStyle: TextStyle(
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
                    child: Text('Finish',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0,
                          color: Colors.white54
                      ),
                    ),
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF9bcd9b),
                      borderRadius:BorderRadius.only( topLeft: Radius.circular(5),topRight: Radius.circular(5))
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
