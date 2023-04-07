import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'demopage.dart';

class EmailLink extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmailLinkState();
}

class _EmailLinkState extends State<EmailLink>
    with WidgetsBindingObserver {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  late bool _success=false;
  late String _userEmail;
  late String _userID;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _emailController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final PendingDynamicLinkData data =
      await FirebaseDynamicLinks.instance.getInitialLink();
      if( data.link != null ) {
        handleLink(data .link,_emailController.text);
      }
      FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData dynamicLink) async {
            final Uri? deepLink = dynamicLink?.link;
            handleLink(deepLink!,_emailController.text);
          }, onError: (OnLinkErrorException e) async {
        print('onLinkError');
        print(e.message);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: const Text('Test sign in with email and link'),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter your email.';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _signInWithEmailAndLink();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _success ==null
                    ? ''
                    : (_success
                    ? 'Successfully signed in, uid: ' + _userID
                    : 'Sign in failed'),
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }


  Future<void> _signInWithEmailAndLink() async {
    _userEmail = _emailController.text;
    return await FirebaseAuth.instance.sendSignInLinkToEmail(
      email: _userEmail, actionCodeSettings: acs,
      // url: 'https://flutterauth.page.link/',
      // handleCodeInApp: true,
      // iOSBundleID: 'com.google.firebase.flutterauth',
      // androidPackageName: 'com.google.firebase.flutterauth',
    );
  }

  var acs = ActionCodeSettings(
    // URL you want to redirect back to. The domain (www.example.com) for this
    // URL must be whitelisted in the Firebase Console.
      url: 'https://interviewprep.page.link/',
      // This must be true
      handleCodeInApp: true,
      // iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.interviewprep',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '1');

  // void handleLink(Uri link) async {
  //   if (link != null) {
  //     final UserCredential user = (await FirebaseAuth.instance.signInWithEmailLink(
  //       email: _userEmail,
  //       emailLink: link.toString()
  //     )
  //
  //     if (user != null) {
  //       setState(() {
  //         _userID = user.credential as String;
  //         _success = true;
  //         print("Welcome");
  //         Navigator.of(context)
  //                 .push(MaterialPageRoute(builder: (context) => const DemoPage()));
  //       });
  //     } else {
  //       setState(() {
  //         _success = false;
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       _success = false;
  //     });
  //   }
  //   setState(() {});
  // }
  void handleLink(Uri link,userEmail) async {
    if (link != null) {
      print(userEmail);
      final UserCredential user = await FirebaseAuth.instance.signInWithEmailLink(
        email:userEmail,
        emailLink:link.toString(),
      );
      if (user != null) {
        print(user.credential);
      }
    } else {
      print("link is null");
    }
  }

  // void handleLink(Uri link) async {
  //   if (link != null) {
  //     final User user = (await FirebaseAuth.instance.isSignInWithEmailLink(
  //       email: _userEmail,
  //       link: link.toString(),
  //     ))
  //         .user;
  //     if (user != null) {
  //       setState(() {
  //         _userID = user.uid;
  //         _success = true;
  //       });
  //     } else {
  //       setState(() {
  //         _success = false;
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       _success = false;
  //     });
  //   }
  //   setState(() {});
  // }
}