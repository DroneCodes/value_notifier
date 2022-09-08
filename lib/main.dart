import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fisayo Demo',
      home: MyHomePage(title: 'Value Notifier Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rotate = ValueNotifier(0); // This gives the widget the application the ability to rotate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: rotate,
          child: _triangleShape(),
          builder: <dynamic>(context, n, c) {
            return Transform.rotate(
              angle: (n! * (pi / 180)),
              child: c,
            );
            
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          rotate.value += 30;
          if (rotate.value >= 180) {
            rotate.value = 0;
          }
        },
        child: const Icon(Icons.rotate_right),
      ),
    );
  }




  _triangleShapes() {
    return ClipPath(
      child: Container(
        color: Colors.red,
        width: 200,
        height: 200,
      ),
      clipper: _Triangle(),
    );
  }
}

Container _triangleShape() {
  return _triangleShape();
}

class _Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, 0); // center of the container
    path.lineTo(size.width / 2, 0); // center of the container
    path.lineTo(size.width, size.height); // down right part of the container
    path.lineTo(0, size.height); // down left part of the cotainer
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
