import 'package:flutter/material.dart';
import 'package:flutter_app/screens/feedback.dart';
class Confirm extends StatefulWidget {
  final String value;
  Confirm({Key key,this.value}) : super (key : key);
  ConfirmState createState() => new ConfirmState();
}
class ConfirmState extends State<Confirm>{


  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {

    void _yes(){
      var route = new MaterialPageRoute(
          builder: (BuildContext context) => new FeedackClass(
            value: widget.value));
          Navigator.of(context).push(route);
       //Navigator.pushNamed(context, "/feedback");
    }
    void _no(){
      Navigator.pop(context);
    }

    var yesBtn = new MaterialButton(
      onPressed: _yes,
      height: 50.0,
      minWidth: 300.0,
      color: hexToColor("#F2A03D"),
      //splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("Yes",
        style: new TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 30.0
        ),),
    );

    var noBtn = new MaterialButton(
      onPressed: _no,
      height: 50.0,
      minWidth: 300.0,
      color: hexToColor("#F2A03D"),
      //splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("No",
        style: new TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 30.0
        ),),
    );

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
      Padding(
       child : Container(
        padding: new EdgeInsets.only(top: 10.0),
        height: statusBarHeight + 66.0,
        color: Colors.blue,
        child: new Center(
          child: new Text(
              "${widget.value} confirm entered data",
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0
              )
          ),
        ),
      ),
        padding: EdgeInsets.only(top: 150.0),
      ),
      new Padding(
        padding: const EdgeInsets.only(top: 40.0),
      ),
      yesBtn,
      new Padding(
        padding: const EdgeInsets.only(top: 40.0),
      ),
      noBtn,
      ]
    )
    );
  }
}