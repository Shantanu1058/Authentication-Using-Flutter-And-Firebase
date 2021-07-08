import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signin_and_login_using_flutter/helpers/helpersfunctions.dart';
import 'package:signin_and_login_using_flutter/screens/logout.dart';
import 'package:signin_and_login_using_flutter/widget/authenticate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLogIn = false;
  getUserLogInState() async {
    return await HelperFunctions.getUserLoggedIn().then((value) {
      setState(() {
        isUserLogIn = value;
      });
    });
  }

  @override
  void initState() {
    getUserLogInState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SignIn And LogIn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isUserLogIn != null
          ? isUserLogIn
              ? LogOutScreen()
              : Authenticate()
          : Authenticate(),
      routes: {
        LogOutScreen.routName: (context) => LogOutScreen(),
      },
    );
  }
}
