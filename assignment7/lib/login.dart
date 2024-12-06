// import 'dart:ffi';

import 'package:assignment7/home.dart';
import 'package:assignment7/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void loginn() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    if (email == "" || password == "") {
      print("Please fill up with details");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (userCredential.user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.pinkAccent,
      body: Column(
        children: [
          Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                            "Log in",
                            style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 33, color: Colors.black),
                          ),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black)],
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/previews/018/930/476/non_2x/facebook-logo-facebook-icon-transparent-free-png.png"))),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black)],
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"))),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black)],
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqE7ERTStK3zgjiqrlTkaRE_-1sTuLHZ6iq7vSrTYKEolMZwHHrV9b8DUV7U_2ibQ3SYc&usqp=CAU"))),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "or user your email for registration",
            style: TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pinkAccent.shade100),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pinkAccent.shade100),
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              // loginn();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Signup()));
            },
            child: Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.pinkAccent.shade100),
              child: Center(
                  child: Text(
                "SIGN UP",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
              )),
            ),

          ),

          SizedBox(height: 10,),

          InkWell(
            onTap: () {
              loginn();
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
            },

            child: Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.pinkAccent.shade100),
              child: Center(
                  child: Text(
                "Login",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
              )),
            ),
          )
        ],
      ),
    );
  }
}
