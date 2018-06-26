
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/Register.dart';
import 'package:flutter_app/screens/feedback.dart';
import 'package:flutter_app/screens/confirm.dart';

final routes = {
  '/login':         (BuildContext context) => new LoginScreen(),
  '/register':         (BuildContext context) => new RegisterClass(),
  '/' :          (BuildContext context) => new LoginScreen(),
  '/feedback' : (BuildContext context) => new FeedackClass(),
  '/confirm' : (BuildContext context) => new Confirm(),
};