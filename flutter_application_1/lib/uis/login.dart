import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/login_bloc.dart';
import 'package:flutter_application_1/uis/discover_screen.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginBloc bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dang nhap"),
      ),
      body: Column(
        children: [
          emailInput(),
          const SizedBox(
            height: 15,
          ),
          passwordInput(),
          const SizedBox(
            height: 15,
          ),
          StreamBuilder<String>(
            stream: bloc.errorStream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? "",
                style: const TextStyle(color: Colors.red),
              );
            },
          ),
          loginButton()
        ],
      ),
    );
  }

  emailInput() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        onChanged: (value) {
          bloc.username = value;
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "jane@example.com",

          // border: OutlineInputBorder(borderSide: ),
        ),
      ),
    );
  }

  passwordInput() {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: TextField(
        onChanged: (value) {
          bloc.password = value;
        },
        obscureText: true,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "Password",
        ),
      ),
    );
  }

  loginButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          bool isSuccess = bloc.login();
          if (isSuccess) {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => DiscoverScreen())));
          }
        },
        child: const Text(
          "LOG IN",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
