import 'package:flutter/material.dart';
import 'package:flutter_no_internet_view/ui/error_content.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this)..addStatusListener((status) {
          if(status == AnimationStatus.completed) {
            animationController.reverse();
          }

          if(status == AnimationStatus.dismissed) {
            animationController.forward();
          }
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return ErrorContent(controller: animationController,);
        })
    );
  }
}
