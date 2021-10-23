
import 'package:amit_shope/Screens/bottom_nav/bottom_nav_bar.dart';
import 'package:amit_shope/Screens/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: size.height * 0.12
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/logo/logo.png"),
                height: size.height * 0.12,
                width: size.width * 0.7,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),

                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter user name';
                      }
                    }
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter email';
                      }
                    }
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: TextFormField(
                    obscureText: isPassword,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: IconButton(
                        icon: isPassword
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter password';
                      }
                    }
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              MaterialButton(
                onPressed: ()async {
                  if(formKey.currentState!.validate()) {
                    var result =await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text
                    );
                    if(result != null)
                    {
                      var userInfo = FirebaseFirestore.instance.collection('users').doc(result.user!.uid).set(
                          {
                            'email': result.user!.email,
                            'name' : nameController.text,
                            'id' : result.user!.uid
                          });

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen() ));                      }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.06,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.red[700],
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text("Have an account?"),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen())
                  );
                },
                child: Text(
                  "Go Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.05,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
