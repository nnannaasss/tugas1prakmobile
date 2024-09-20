import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = false;

  final Color pastelGreen = const Color.fromARGB(255, 15, 97, 90);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Selamat Datang! Silahkan Login terlebih dahulu'),
          backgroundColor: pastelGreen,
        ),
        body: Center( 
          child: SizedBox(
            width: 300, 
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                usernameField(),
                passwordField(),
                loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(color: pastelGreen),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: pastelGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: pastelGreen),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: !visible,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(color: pastelGreen),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
            color: pastelGreen,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: pastelGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: pastelGreen),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'admin' && password == 'admin') {
            setState(() {
              text = 'Login Berhasil';
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = 'Login Gagal';
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
            backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
            content: Text(text),
            duration: const Duration(seconds: 3),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: pastelGreen,
          foregroundColor: Colors.white,
        ),
        child: const Text('Login'),
      ),
    );
  }
}
