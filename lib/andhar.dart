import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class andhar extends StatelessWidget {
   andhar({super.key});
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              }).onError((error, stackTrace) {
                Fluttertoast.showToast(
                                msg: error.toString(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
              });
            },
            child: Text("Logout")),
      ),
    );
  }
}
