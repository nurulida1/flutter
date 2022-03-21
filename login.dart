import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sga/mainmenu.dart';
import 'package:sga/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'config.dart';
import 'user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  late SharedPreferences prefs;
  bool _obscureText = true;
  late final ValueChanged<bool?>? onChanged;
  @override
  void initState() {
    loadPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Text(
                        "Login to your account",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: 'Email',
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: 'Password',
                      icon: Icon(Icons.lock),
                      suffix: InkWell(
                          onTap: _togglePass, child: Icon(Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                  obscureText: _obscureText,
                ),
                SizedBox(height: 15),
                MaterialButton(
                    minWidth: 300,
                    height: 60,
                    child: Text('Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    onPressed: _onLogin,
                    color: Color(0xff0095FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?"),
                      Text(" Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18))
                    ],
                  ),
                ),
                SizedBox(
                    height: 200,
                    width: 400,
                    child: Lottie.asset('assets/images/signin.json'))
              ],
            )));
  }

  Future<void> loadPref() async {
    prefs = await SharedPreferences.getInstance();
    String _email = prefs.getString("email") ?? '';
    String _password = prefs.getString("password") ?? '';

    setState(() {
      _emailController.text = _email;
      _passwordController.text = _password;
    });
  }

  void _togglePass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onLogin() async {
    String _email = _emailController.text.toString();
    String _password = _passwordController.text.toString();
    http.post(
        Uri.parse(CONFIG.SERVER + "/272932/sweetgiftbox/php/login_user.php"),
        body: {"email": _email, "password": _password}).then((response) async {
      print(response.body);
      if (response.body == "failed") {
        Fluttertoast.showToast(
            msg: "Login Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Login Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('email', _emailController.text);
        List userdata = response.body.split(",");
        User user = User(
            email: _email,
            password: _password,
            name: userdata[1],
            datereg: userdata[2],
            status: userdata[3]);
        Navigator.push(
            context, MaterialPageRoute(builder: (content) => HomePage()));
      }
    });
  }

  void _registerNewUser() {
    Navigator.push(
        context, MaterialPageRoute(builder: (content) => SignUpPage()));
  }

  void _forgotPassword() {
    TextEditingController _useremailcontroller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("FORGOT YOUR PASSWORD?"),
            content: Center(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  new Container(
                      height: 500,
                      child: Column(
                        children: [
                          Image.asset('assets/images/forgotpassword.png'),
                          SizedBox(height: 20),
                          Text(
                              "Not to worry, we got you! Let's get you a new password.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w300)),
                          SizedBox(height: 30),
                          Text("Enter your recovery email:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          TextField(
                            controller: _useremailcontroller,
                            decoration: InputDecoration(
                                labelText: 'Email', icon: Icon(Icons.email)),
                          )
                        ],
                      )),
                ],
              )),
            ),
            actions: [
              TextButton(
                child: Text("SUBMIT", style: TextStyle(fontSize: 16)),
                onPressed: () {
                  print(_useremailcontroller.text);
                  _resetPassword(_useremailcontroller.text.toString());
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: Text("CANCEL", style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  void _resetPassword(String emailreset) {
    http.post(
        Uri.parse(
            "https://nurulida1.com/272932/sweetgiftbox/php/forgot_password.php"),
        body: {"email": emailreset}).then((response) {
      print(response.body);
      if (response.body == "failed") {
        Fluttertoast.showToast(
            msg: "No email is found",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Color.fromRGBO(191, 30, 46, 50),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Success reset password. Please check your email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Color.fromRGBO(191, 30, 46, 50),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  Future<void> storePref(bool value, String email, String password) async {
    prefs = await SharedPreferences.getInstance();
    if (value) {
      await prefs.setString("email", email);
      await prefs.setString("password", password);
      await prefs.setBool("rememberme", value);
      return;
    } else {
      await prefs.setString("email", '');
      await prefs.setString("password", '');
      await prefs.setBool("rememberme", value);
      setState(() {
        _emailController.text = "";
        _passwordController.text = "";
      });
      return;
    }
  }
}
