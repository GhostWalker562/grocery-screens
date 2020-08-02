import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screens_cart/core/sizeconfig.dart';
import 'package:screens_cart/screens/details/details.dart';
import 'package:screens_cart/screens/landing/landing.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Grocery Shopping App',
      home: SizeConfig(),
        debugShowCheckedModeBanner: false,
    );
  }
}

class SizeConfig extends StatelessWidget {
  const SizeConfig({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sc().init(context);

    return LandingPage();
  }
}
