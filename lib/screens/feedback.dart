import 'package:flutter/material.dart';

class FeedackClass extends StatefulWidget {
  final String value;
  FeedackClass({Key key,this.value}) : super (key : key);
     FeedState createState() => new FeedState();
}
 class FeedState extends State<FeedackClass>{
   Color hexToColor(String code) {
     return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
   }
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    // TODO: implement build
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: hexToColor("#2e87ba"),
    body: new Column(
    children: <Widget>[
      new Padding(
      child : Container(
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + 66.0,
        color: Colors.blue,
        child: new Center(
          child: new Text(
              "Thank you ${widget.value} for your data ;)",
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0
              )
          ),
        ),
      ),
        padding: EdgeInsets.only(top: 200.0),
      ),
      ]
    )
    );
  }
}