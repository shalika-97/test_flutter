import 'package:flutter/material.dart';

import 'api_layout.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Image.network(
                  "https://static.wixstatic.com/media/abe5aa_71e631cabc23457e930e7c4a95fe08cd~mv2_d_4000_1303_s_2.png/v1/fill/w_153,h_50,al_c,q_85,usm_0.66_1.00_0.01/abe5aa_71e631cabc23457e930e7c4a95fe08cd~mv2_d_4000_1303_s_2.webp"),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Login in to your account",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: width * 0.75,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width * 0.75,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: width * 0.75,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Theme.of(context).primaryColor,
                onPressed: () => _login(),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("Login now"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == "12" && password == "12") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => APILayout()));
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Login fail"),
            content: Text("Invalid password or username"),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Okay"),
              )
            ],
          ));
    }
  }
}
