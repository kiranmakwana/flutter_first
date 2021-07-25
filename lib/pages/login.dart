import 'package:first_project/util/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  // int? i = 10;
  bool changeClick = false;
  //final _formKeySubmit = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey  = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    // _formKeySubmit.currentState.save();
     if (_formKey.currentState!.validate()) {
      setState(() {
        changeClick = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeClick = false;
      });
     }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "WelCome $name",
            style: TextStyle(
                fontSize: 28,
                color: Colors.blue,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter UserName", labelText: "UserName"),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        // print("null");
                        return "UserName Not Empty";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username is can not be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                  // )
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeClick ? 8 : 12),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        width: changeClick ? 100 : 120,
                        height: 40,
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 200),
                        child: changeClick
                            ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                            : Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // decoration: BoxDecoration(
                        //   color: Colors.deepPurple,

                        // ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}