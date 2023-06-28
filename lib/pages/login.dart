// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geetsunam/controller/fetch_provider.dart';
import 'package:geetsunam/home_page.dart';
import 'package:geetsunam/pages/reusable.dart';
import 'package:geetsunam/pages/signup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late SharedPreferences pref;
  FetchData fetchlogin = FetchData();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // height: 350,
                  // width: 350,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    "images/geetsunamgif.gif",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //starting text
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Hey, \n',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 84, 84),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: 'Login ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 84, 84),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: 'Now',
                          style: TextStyle(
                              // color: Colors.red,
                              color: Color.fromARGB(255, 50, 58, 58),
                              fontWeight: FontWeight.bold,
                              fontSize: 25))
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //Please sign-in............
                const Text(
                  "Please sign-in to your account",
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                ), //form
                SizedBox(
                  height: 15,
                ),
                //textformfield
                //email
                foremail("Email", email),
                SizedBox(
                  height: 10,
                ),
                //password
                forpassword("Password", password),
                SizedBox(
                  height: 10,
                ),
                //Login Button
                Consumer<FetchData>(builder: (context, _, child) {
                  return InkWell(
                    onTap: (() async {
                      log("Login");
                      fetchlogin.login(email.value.text, password.value.text);
                      _.setTokenValue();
                      if (_.token != null) {
                        setState(() {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Homepage()),
                          ),
                        );
                      }
                    }),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 50, 58, 58),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: 50,
                ),
                //sign-up Buttons
                Row(
                  children: [
                    Text(
                      "Don't have account? ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 58, 61, 60), fontSize: 15),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Signup()),
                          ),
                        );
                      }),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }
}
