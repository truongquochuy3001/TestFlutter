import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int currentPos = 0;
  List<String> listPaths = [
    "assets/images/g1.png",
    "assets/images/g1.png",
    "assets/images/g1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu_open_outlined,
                    size: 40,
                  ),
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Matt",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/images/1.jpg",
                      width: 60,
                      height: 60,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 238, 233, 233),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.location_on_rounded,
                    size: 40,
                  ),
                  Text(
                    "East 42nd St, NewYork",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          
          CarouselSlider(
            options: CarouselOptions(height: 200.0),
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      "assets/images/g1.png",
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Favorites",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigate_next_rounded,
                      size: 35,
                    )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                favoriteItem(
                    context, "assets/images/download.png", "Burger", "15 min"),
                favoriteItem(
                    context, "assets/images/download.png", "Burger", "15 min"),
                favoriteItem(
                    context, "assets/images/download.png", "Burger", "15 min"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Near you",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigate_next_rounded,
                      size: 35,
                    )),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                nearyouItem(context, "assets/images/g1.png", "NYC pizza"),
                nearyouItem(context, "assets/images/g1.png", "NYC pizza"),
                nearyouItem(context, "assets/images/g1.png", "NYC pizza"),
                nearyouItem(context, "assets/images/g1.png", "NYC pizza"),
                nearyouItem(context, "assets/images/g1.png", "NYC pizza"),
                nearyouItem(context, "assets/images/g1.png", "NYC pizza"),

              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.headset_sharp), label: ""),
          ]),
    );
  }
  nearyouItem(BuildContext context, String image, String name){
    return Container(
      width: 120,
      height: 100,
      child: Column(
        children: [
          Image.asset(image, width: 100, height: 80,),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ],
      ),
    );
  }
  
  favoriteItem(BuildContext context, String image, String name, String time) {
    return Container(
      color: const Color.fromARGB(255, 226, 225, 225),
      width: MediaQuery.of(context).size.width / 4,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 40,
            height: 40,
          ),
          Text(name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(
            time,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
