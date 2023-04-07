import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'demopage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Button Example"),
        centerTitle: true,
      ),
      body: Center(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Flexible(
                 child: SizedBox(
                   height: 50,
                   width:450,
                   child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                           primary: Color(0xffdd3953),
                           shape: new RoundedRectangleBorder(
                             borderRadius: new BorderRadius.circular(5.0),
                           )
                       ),
                       onPressed: (){
                       },
                       child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight:FontWeight.w600),)),
                 ),
               ),
               SizedBox(
                 width:15,
               ),
               Flexible(
                 child: SizedBox(
                   height: 50,
                   width:450,
                   child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         side: BorderSide(width: 1.0,color: Color(0xffdd3953)),
                         shape: new RoundedRectangleBorder(
                           borderRadius: new BorderRadius.circular(5.0),
                         ),
                         primary: Colors.black,),
                       onPressed: (){
                       },
                       child: Text("Sign Up",style: TextStyle(color: Color(0xffdd3953),fontSize: 16,fontWeight: FontWeight.w600),)),
                 ),
               ),
             ],
           ),
        // child: Expanded(
        //   child: SizedBox(
        //     height: 100,
        //     width: 200,
        //     child: ElevatedButton(
        //       child: Text('Elevated Button'),
        //       style: ElevatedButton.styleFrom(
        //         primary: Colors.black,
        //         // side: BorderSide(color: Colors.yellow, width: 5),
        //         textStyle: const TextStyle(
        //             color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(5))),
        //         shadowColor: Colors.red,
        //       ),
        //       onPressed: () {
        //         Navigator.of(context)
        //                  .push(MaterialPageRoute(builder: (context) => const DemoPage()));
        //       },
        //     ),
        //   ),
        // ),
        // child: ElevatedButton(
        //   child: const Text('Click Me'),
        //   onPressed: (){
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => const DemoPage()));
        //   },
        // ),
      ),

    );
  }
}
