import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}

class _State extends State<MyApp> {
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
                    // textCapitalization: TextCapitalization.words,
                    inputFormatters: [
                      // UpperCaseTextFormatter(),
                      UpperCaseTextFormatter(),
                      FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),
                    ],
                    controller: nameController,
                    style: TextStyle(color: Colors.blue),
                    // textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // labelText: 'User Name',
                      // labelStyle: TextStyle(color: Colors.pink, fontSize: 20),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Enter Your Name',
                      // hintStyle: TextStyle(
                      //     color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    // textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(color: Colors.blue),
                    controller: passwordController,
                    // obscureText: true,
                    decoration: InputDecoration(
                      //  ,.fillColor: Colors.red,
                      // filled: true,
                      // floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.pink, fontSize: 20),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                FloatingActionButton(
                  // When the user presses the button, show an alert dialog containing
                  // the text that the user has entered into the text field.
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Hello"),
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(nameController.text),
                        );
                      },
                    );
                  },
                  tooltip: 'Show me the value!',
                  child: const Icon(Icons.text_fields),
                ),
              ],
            )));
  }
}
