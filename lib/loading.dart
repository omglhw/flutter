import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'dart:async';
import './router/application.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      print('Flutter starting!!');
      Application.router.navigateTo(context, '/');
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   print('Fluter init!!');
  //   // Future.delayed(Duration(seconds: 10), () {
  //   //   print('Fluter starting!!');
  //   //   // Application.router.navigateTo(context,"/");
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(
      child: Stack(children: <Widget>[
        Image.asset('images/Tulips.jpg'),
        Positioned(
          top: 0,
          child: Container(
            width: 400,
            child: Center(
                child: Text(
              'Flutter Site',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  decoration: TextDecoration.none),
            )),
          ),
        )
      ]),
    ));
  }
}
