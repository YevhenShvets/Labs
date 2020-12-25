import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Verdana"),
      title: "Menu",
      home: HomeScreen1(),
    );
  }
}


class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreenState1 createState() => _HomeScreenState1();
}

class _HomeScreenState1 extends State<HomeScreen1> with TickerProviderStateMixin {
  Animation _heartAnimation;
  AnimationController  _heartAnimationController;
  Color _color = Colors.red;
  @override
  void initState() {
    super.initState();
      _heartAnimationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 2000));
      _heartAnimation = Tween(begin: 150.0, end: 270.0).animate(CurvedAnimation(
          curve: Curves.bounceIn, parent: _heartAnimationController));

      _heartAnimationController.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState((){
            final random = Random();
            _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
            );
          });
          _heartAnimationController.repeat(period: Duration(milliseconds: 100));
        }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _heartAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          heartChild(),
        ],
      ),
    );
}
  Widget heartChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: GestureDetector(
                      child: Icon(
                        Icons.favorite,
                        color: _color,
                        size: _heartAnimation.value,
                      ),
                      onTap: (){ 
                        if(!_heartAnimationController.isAnimating){
                          _heartAnimationController.forward();
                        }else _heartAnimationController.stop();
                        final random = Random();
                        _color = Color.fromRGBO(
                          random.nextInt(256),
                          random.nextInt(256),
                          random.nextInt(256),
                          1,
                        );
                      },
                    )
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}