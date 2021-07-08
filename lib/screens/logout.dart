import 'package:flutter/material.dart';
import 'package:signin_and_login_using_flutter/helpers/auth.dart';
import 'package:signin_and_login_using_flutter/helpers/helpersfunctions.dart';
import 'package:signin_and_login_using_flutter/widget/authenticate.dart';

class LogOutScreen extends StatefulWidget {
  static const routName = '/logout';
  const LogOutScreen({Key key}) : super(key: key);

  @override
  _LogOutScreenState createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: GestureDetector(
                            onTap: () async {
                              await AuthMethods().signOut().then((value) =>
                                  HelperFunctions.saveUserLoggedIn(
                                      value != null ? true : false));
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => Authenticate(),
                              ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app),
                                Text("LogOut")
                              ],
                            )),
                        value: 0)
                  ])
        ],
        title: Text("Successfully Signed In"),
      ),
      body: Center(
        child: Text("Hi ${HelperFunctions.getUserName()}"),
      ),
    );
  }
}
