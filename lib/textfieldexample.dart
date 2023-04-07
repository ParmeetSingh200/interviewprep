import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield({Key? key}) : super(key: key);

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('Flutter TextField Example'),
  ),
  body: Padding(
  padding: EdgeInsets.all(15),
  child: Column(
  children: <Widget>[
  Padding(
  padding: EdgeInsets.all(15),
  child: TextField(
  controller: nameController,
  decoration: InputDecoration(
  border: OutlineInputBorder(),
  labelText: 'User Name',
  hintText: 'Enter Your Name',
  ),
  ),
  ),
  Padding(
  padding: EdgeInsets.all(15),
  child: TextField(
  controller: passwordController,
  obscureText: true,
  decoration: InputDecoration(
  border: OutlineInputBorder(),
  labelText: 'Password',
  hintText: 'Enter Password',
  ),
  ),
  ),
    FloatingActionButton(

  child: Text('Sign In'),
  onPressed: (){
     showDialog(
  context: context,
  builder: (context) {
  return AlertDialog(
  title: Text("Alert Message"),
  // Retrieve the text which the user has entered by
  // using the TextEditingController.
  content: Text(nameController.text),
  actions: <Widget>[
  ],
  );
  },
  );
  },
  )
  ],
  )
  )
  );
  }
  }

