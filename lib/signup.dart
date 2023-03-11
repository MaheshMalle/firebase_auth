import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'andhar.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Firebase Auth"),
        backgroundColor: Colors.grey,
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Container(
            height: 200,
            width: 400,
            child: const Text(
              "Sign Up",
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
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
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
                  validator: (value) {
                    if (!EmailValidator.validate(value!)) {
                      return "Enter a valid email";
                    } else {
                      return null;
                    }
                  },
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a password";
                    } else if (value!.length < 6) {
                      return "Password must be of minimum 6 characters";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    // margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString())
                              .then((value) {
                            setState(() {
                              loading = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => andhar(),
                              ),
                            );
                          }).onError((error, stackTrace) {
                            setState(() {
                              loading = false;
                            });
                            Fluttertoast.showToast(
                              msg: "Error: Something went wrong",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          });
                        }
                      },
                      child: Text("Sign Up"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )),
                Visibility(
                  visible: loading,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.8),
                    child: SpinKitCircle(
                      color: Colors.blue,
                      size: 50.0,
                    ),
                  ),
                ),
              ]),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          // margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: Text("Already Have an account?"),
                      )),
                    ),
                  ),
                ],
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
