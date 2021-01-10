import 'package:flutter/material.dart';
// import 'package:bus/src/model/userModel.dart';
// import 'package:bus/src/apis/request.dart';
// import 'package:bus/global.dart';
// import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // List<User> user = new List();
  @override
  void initState() {
    super.initState();
  }

  TextEditingController usuarioController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20.0),
          // color: Colors.blue,
          child: Column(
            children: [
              //para el titulo y foto
              Container(
                height: size.height / 2.7,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/login.png',
                  height: 150.0,
                  width: 200.0,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: size.height * 0.05,
                child: Center(
                    child: Text(
                  "FOCUS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )),
              ),
              // para el input usuario
              Container(
                height: size.height / 6,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    icon: Icon(Icons.person, color: Colors.white),
                    labelText: 'Usuario',
                  ),
                  controller: usuarioController,
                ),
              ),
              // para el input password
              Container(
                height: size.height / 6,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    icon: Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                    labelText: 'Contraseña',
                  ),
                  controller: passwordController,
                ),
              ),
              // para el boton
              RaisedButton(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 0.0,
                color: Colors.lightBlue,
                textColor: Colors.white,
                onPressed: () => Navigator.pushNamed(context, 'home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
