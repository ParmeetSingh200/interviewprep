import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interviewprep/welcomepage.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Hello Guys"),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: ()
        {
          print("Picture Clicked");
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
              content: new Text("Welcome  to our site")
          ));
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage()));
          // Navigator.pushAndRemoveUntil<dynamic>(
          //   context,
          //   MaterialPageRoute<dynamic>(
          //     builder: (BuildContext context) => WelcomePage(),
          //   ),
          //       (route) => false,//if you want to disable back feature set to false
          // );

        },
        child: Container(
         // height: 300,
        //  width: 300,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.red,
            ),
          //  borderRadius: BorderRadius.circular(80),
            image:
             DecorationImage(
          image: new AssetImage(
              "assets/images/welcome-bg.jpg"),
          fit: BoxFit.fill,
        )
            //,AssetImage("assets/images/welcome-bg.jpg"),
          ),
         // child: Image.asset("assets/images/welcome-bg.jpg",fit: BoxFit.contain,),
          //alignment: Alignment.center,

        ),
      ),
    );
  }
}
