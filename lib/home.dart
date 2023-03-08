import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Firebase Auth"),
        backgroundColor: Colors.grey,
      ),
      body: Column(children: [
        Container(
          height: 200,
          width: 400,
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    maxWidth: 25,
                  ),
                  border: InputBorder.none,
                  hintText: "Enter Your Mail",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.lock_clock_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    maxWidth: 25,
                  ),
                  border: InputBorder.none,
                  hintText: "Enter Your Password",
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        // margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?"),
                    )),
                  ),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                // margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => form(),
                    //   ),
                    // );
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ))
          ]),
        )
      ]),
    );
  }
}
