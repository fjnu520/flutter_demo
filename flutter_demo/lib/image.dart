import 'package:flutter/material.dart';

class ImageApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ImageState();
  }
}

class _ImageState extends State<ImageApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image'),
      ),
      body: new Column(
        children: <Widget>[
          new Image.network(
              'https://flutter.io/images/homepage/header-illustration.png'),
        ],
      ),
    );
  }
}
