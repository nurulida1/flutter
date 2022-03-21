import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordControllera = new TextEditingController();
  TextEditingController _passwordControllerb = new TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    Icon(Icons.arrow_back_ios, size: 20, color: Colors.black))),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(children: <Widget>[
                Text("Sign up",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text("Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]))
              ]),
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 3, left: 3),
                    labelText: ' Name',
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              TextField(
                controller: _passwordControllera,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 3, left: 3),
                    hintText: ' Password',
                    icon: Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: _togglePass,
                      child: Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))),
                obscureText: _obscureText,
              ),
              TextField(
                controller: _passwordControllerb,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 3, left: 3),
                    labelText: ' Confirm your password',
                    icon: Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: _togglePass,
                      child: Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))),
                obscureText: _obscureText,
              ),
              MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {},
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text("Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text("Login",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18))
                ],
              )
            ],
          ),
        )));
  }

  void _togglePass() {}
}
