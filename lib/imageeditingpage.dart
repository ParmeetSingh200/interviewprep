import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageEditingPage extends StatefulWidget {
  const ImageEditingPage({Key? key}) : super(key: key);

  @override
  State<ImageEditingPage> createState() => _ImageEditingPageState();
}

class _ImageEditingPageState extends State<ImageEditingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Image Editing"),
        centerTitle: true,
      ),
    );
  }
}
