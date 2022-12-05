import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * (8 / 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(
                  "images/Group.png",
                ),
                // Image.asset("assets/images/Group.png", width: MediaQuery.of(context).size.width/10, height: MediaQuery.of(context).size.height/2,),
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height / 35,
                left: MediaQuery.of(context).size.width / 15,
                child: Image.asset("images/Component.png"))
          ]),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * (2 / 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    height: MediaQuery.of(context).size.height * (1 / 15),
                    width: MediaQuery.of(context).size.width * (4 / 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: const Text("LOG IN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * (1 / 14),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * (1 / 15),
                    width: MediaQuery.of(context).size.width * (4 / 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: const Text(
                          "REGISTER",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
