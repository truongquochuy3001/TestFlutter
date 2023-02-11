import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/blocs/image_blocs.dart';
import 'package:flutter_application_1/uis/chat_screen.dart';
import 'package:flutter_application_1/uis/discover_screen.dart';
import 'package:flutter_application_1/uis/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DogImage list = DogImage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              title(context, "Search"),
              searchInput(context),
              const SizedBox(
                height: 15,
              ),
              imageList(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DiscoverScreen()));
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()));
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

  Widget searchInput(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Search all photos",
        ),
      ),
    );
  }

  Widget imageList(BuildContext context) {
    return Expanded(
      child: GridView.count(crossAxisCount: 3, children: [
        ...list.dogImage.map(
          (e) {
            return Image.asset(
              e,
              fit: BoxFit.fill,
            );
          },
        )
      ]),
    );
  }
}
