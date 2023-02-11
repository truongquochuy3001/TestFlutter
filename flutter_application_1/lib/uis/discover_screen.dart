import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/image_blocs.dart';
import 'package:flutter_application_1/blocs/user_blocs.dart';
import 'package:flutter_application_1/model/chat_model.dart' as chat;
import 'package:flutter_application_1/uis/chat_screen.dart';
import 'package:flutter_application_1/uis/profile_screen.dart';
import 'package:flutter_application_1/uis/search_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  ListImage list = ListImage();
  UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              width: 25,
            ),
            title(context, "Discovery"),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              width: 25,
            ),
            contentTitle(context, "WHAT'S NEW TODAY"),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/Rectangle 2.8.png",
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 15,
            ),
            userInfo(context, "assets/images/Ellipse.png", "Ridhwan Nordin",
                "@ridzjcob"),
            const SizedBox(
              height: 20,
            ),
            contentTitle(context, "BROWSE ALL"),
            const SizedBox(
              height: 15,
            ),
            imageList(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              style: const ButtonStyle(),
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ChatScreen())));
                },
                icon: const Icon(Icons.comment)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                icon: const Icon(Icons.person)),
          ],
        ),
      ),
    );
  }

  Widget title(BuildContext context, String title) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ],
    );
  }

  Widget contentTitle(BuildContext context, String text) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget userInfo(
      BuildContext context, String avatar, String userName, String nickName) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        CircleAvatar(
          backgroundImage: AssetImage(avatar),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(nickName),
          ],
        ),
      ],
    );
  }

  Widget imageList(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        ...list.listImage.map(
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
