// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:geetsunam/pages/reusable.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 80, 35, 10),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //starting text
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: "Let's start, \n",
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 84, 84),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: 'with ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 84, 84),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: 'Registration!',
                          style: TextStyle(
                              // color: Colors.red,
                              color: Color.fromARGB(255, 50, 58, 58),
                              fontWeight: FontWeight.bold,
                              fontSize: 25))
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //Enter your email and password............
                const Text(
                  "Register your account here",
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                ),

                SizedBox(
                  height: 15,
                ),
                //email
                foremail("Email", email),
                SizedBox(
                  height: 10,
                ),
                //password
                forpassword("Password", password),
                SizedBox(
                  height: 20,
                ),
                //Login Button
                InkWell(
                  onTap: (() {}),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      color: Color.fromARGB(255, 50, 58, 58),

                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                //Joined us before? Login
                Row(
                  children: [
                    Text(
                      "Joined us before? ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 58, 61, 60), fontSize: 15),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: Text(
                        'Login',
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
}
