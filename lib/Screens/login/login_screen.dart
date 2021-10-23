
import 'package:amit_shope/Screens/bottom_nav/bottom_nav_bar.dart';
import 'package:amit_shope/Screens/signup/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();


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
                height: size.height * 0.15,
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

                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter an email';
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

                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter an password';
                      }
                    }
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              MaterialButton(
                onPressed: ()async {
                  if(formKey.currentState!.validate())
                  {
                    try
                    {
                      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text
                      );
                      if(result.user!.uid != null)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar() ));
                      }
                    }
                    catch(e)
                    {
                      alertDialogFunc(context, e.toString());
                    }
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
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()
                  )
                  );
                },
                child: Text(
                  "Go SignUp",
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


  Future<Widget> alertDialogFunc(BuildContext context, String error) async
  {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)
        {
          return AlertDialog(
            title: Text('message'),
            content: Text(error),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(true); // dismisses only the dialog and returns true
                },
                child: Text('ok'),
              ),
            ],
          );
        });
  }

}
