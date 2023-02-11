import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/blocs/image_blocs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileImage list = ProfileImage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(child: userPic(context)),
          Center(child: userName(context)),
          Center(child: userAdd(context)),
          const SizedBox(
            height: 10,
          ),
          followBut(context),
          const SizedBox(
            height: 10,
          ),
          messageBut(context),
          const SizedBox(
            height: 10,
          ),
          profilePics(context),
        ],
      ),
    );
  }

  Widget userPic(BuildContext context) {
    return Image.asset("assets/images/Ellipse (8).png");
  }

  Widget userName(BuildContext context) {
    return const Text(
      "Jane",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget userAdd(BuildContext context) {
    return const Text(
      "SAN FRANCISCO, CA",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget followBut(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {},
          child: const Text(
            "Follow Jane",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget messageBut(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black)),
        onPressed: () {},
        child: const SizedBox(
            child: Text(
          "Message",
          style: TextStyle(color: Colors.black),
        )),
      ),
    );
  }

  Widget profilePics(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        ...list.profilePics.map(
          (e) {
            return Image.asset(
              e,
              fit: BoxFit.fill,
            );
          },
        ),
      ],
    );
  }
}
