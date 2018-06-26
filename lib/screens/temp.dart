import 'package:flutter/material.dart';
import 'package:flutter_app/screens/confirm.dart';
class RegisterClass extends StatelessWidget{
  var _textcontrol = new TextEditingController();
  String _fname,_lname,_mobile;
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }


  @override
  Widget build(BuildContext context) {

    final formKey = new GlobalKey<FormState>();

    void _submit(){
      final form = formKey.currentState;
      if(form.validate()) {
        var route = new MaterialPageRoute(
            builder: (BuildContext context) => new Confirm(
              value: _textcontrol.text,));
        //Navigator.pushNamed(context, "/confirm");
        Navigator.of(context).push(route);
      }
    }

    var submitBtn = new MaterialButton(
      onPressed: _submit,
      height: 50.0,
      minWidth: 300.0,
      color: hexToColor("#F2A03D"),
      //splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("Submit",
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
      body:new Theme(
        data: new ThemeData(
            primaryColor: Colors.red,
            brightness: Brightness.dark,
            inputDecorationTheme: new InputDecorationTheme(
              // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
              labelStyle:
              new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),
            )),
        isMaterialAppTheme: true,
        child: new Column(
          children: <Widget>[
            Container(
              //padding: new EdgeInsets.only(top: statusBarHeight),
              //height: statusBarHeight + 66.0,
              color: Colors.blue,
              child: new Center(
                child: new Text(
                    "Please enter your data",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 30.0
                    )
                ),
              ),
            ),
            new Container(
              padding: const EdgeInsets.all(30.0),
              child: new Form(
                key: formKey,
                //autovalidate: true,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[/*
                      new Text("Enter Email",
                        style: new TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 30.0
                        ),
                      ),*/
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Username cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      onSaved: (val) => _fname = val,
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new TextFormField(
                      validator: (val) {
                        if(val.length==0) {
                          return "Password cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      onSaved: (val) => _lname = val,
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),

                      ),

                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                    ),
                    //_isLoading ? new CircularProgressIndicator() : loginBtn
                    submitBtn
                    ,
                    /*new Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      child: registerBtn ,),*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}