import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';
import 'package:flutter_app/data/database_helper.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/login_screen_presenter.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin
{

  final double barHeight = 66.0;
  //Animation
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password;

 // LoginScreenPresenter _presenter;


  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      this.setState(() => _isLoading = true);
      form.save();
      _performLogin();
      //_presenter.doLogin(_username, _password);
    }
  }

  void _performLogin(){
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Email: $_username, password: $_password'),
    ),);
    Navigator.of(_ctx).pushNamed("/register");
  }

  /*void _register(){
    Navigator.pushNamed(_ctx, "/register");
  }*/

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {


    var loginBtn = new MaterialButton(
      onPressed: _submit,
      height: 50.0,
      minWidth: 300.0,
      color: hexToColor("#F2A03D"),
      //splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("Login",
      style: new TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          fontSize: 30.0
      ),),
    );//raised button
    _ctx = context;

    /* var registerBtn = new MaterialButton(
      onPressed: _register,
      height: 50.0,
      minWidth: 300.0,
      color: hexToColor("#F2A03D"),
      //splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("Register",
        style: new TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 30.0
        ),),
    ); */
    var loginForm = new Column(
      children: <Widget>[
            new Column(
            children: <Widget>[
              new Container(
                height: _iconAnimation.value * 140.0,
                width: _iconAnimation.value * 140.0,
                child:new Image ( image:new AssetImage("assets/icon.png")),
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
                            return "Email cannot be empty";
                          }else{
                            return null;
                          }
                        },
                        onSaved: (val) => _username = val,
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
                        onSaved: (val) => _password = val,
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
                      loginBtn
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
        //_isLoading ? new CircularProgressIndicator() : loginBtn
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );


    // Scaffold
    return new Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      backgroundColor: hexToColor("#2e87ba"),
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        /*new Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover)

          ),
        ),*/

        new Theme(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loginForm,
            ],
          ),
        ),
      ]),
      //body:,

    );
  }

}