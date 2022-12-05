import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key, required this.userName});
  final String userName;

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: "the ${widget.userName}",
                            ),
                            onSaved: (String? value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Vui long nhap username";
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Login())));
                                }
                              });
                            },
                            child: const Text(
                              "REGISTER",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    )),
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
