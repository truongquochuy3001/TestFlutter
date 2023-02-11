import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/register_bloc.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

import 'login.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key, required this.userName});
  final String userName;

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  RegisterBloc bloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 14),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * (1 / 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios))
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          bloc.userName = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "the ${widget.userName}",
                        ),
                      ),
                    ),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          bool isSuccess = bloc.register2();
                          if (isSuccess) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => Login()),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(14),
                child: Text.rich(TextSpan(children: [
                  const TextSpan(text: "By signing up, you agree to Photo's "),
                  TextSpan(
                      style: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                      text: "Term of Service",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          //on tap code here, you can navigate to other page or URL
                          String url = "";
                          var urllaunchable = await canLaunch(
                              url); //canLaunch is from url_launcher package
                          if (urllaunchable) {
                            await launch(
                                url); //launch is from url_launcher package to launch URL
                          } else {
                            // ignore: avoid_print
                            print("URL can't be launched.");
                          }
                        }),
                  const TextSpan(
                    text: " and ",
                  ),
                  TextSpan(
                      style: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                      text: "Privacy Policy",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          //on tap code here, you can navigate to other page or URL
                          String url = "";
                          var urllaunchable = await canLaunch(
                              url); //canLaunch is from url_launcher package
                          if (urllaunchable) {
                            await launch(
                                url); //launch is from url_launcher package to launch URL
                          } else {
                            print("URL can't be launched.");
                          }
                        }),
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
