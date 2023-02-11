import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/register_bloc.dart';

import 'register_2.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterBloc bloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dang ky"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              userInput(context),
              const SizedBox(
                height: 25,
              ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              //   width: MediaQuery.of(context).size.width,
              //   height: 70,
              //   child: const Text(
              //     "Register",
              //     style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              //   ),
              // ),
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  passInput(context),
                  const SizedBox(
                    height: 15,
                  ),
                  StreamBuilder<String>(
                    stream: bloc.errorMess,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? "",
                        style: const TextStyle(color: Colors.red),
                      );
                    },
                  ),
                  resButton(context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget userInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        onChanged: (value) {
          bloc.userName = value;
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "jane@example.com",
        ),
      ),
    );
  }

  Widget passInput(BuildContext context) {
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

  Widget resButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          bool isSuccess = bloc.register();
          if (isSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => Register2(userName: bloc.userName)),
              ),
            );
          }
        },
        child: const Text(
          "REGISTER",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
