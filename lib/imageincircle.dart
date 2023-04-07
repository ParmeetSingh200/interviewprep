import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'imageeditingpage.dart';

class ImageCircle extends StatefulWidget {
  const ImageCircle({Key? key}) : super(key: key);

  @override
  State<ImageCircle> createState() => _ImageCircleState();
}

class _ImageCircleState extends State<ImageCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children:[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image:  AssetImage('assets/images/welcome-bg.jpg'),
                    fit: BoxFit.fill
                ),
              ),
            ),
               Positioned(
                bottom: 15, right: 15, //give the values according to your requirement
                child:  InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>ImageEditingPage()));
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:  AssetImage('assets/images/download.png'),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                ),
              ),
        ]
        ),
      ),
    );
  }
}
