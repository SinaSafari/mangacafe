import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final List<Map<String, String>> brands = [
    {
      "image": "assets/images/ds.png",
      "title": "DS",
    },
    {
      "image": "assets/images/kd.png",
      "title": "KD",
    },
    {
      "image": "assets/images/man.png",
      "title": "MAN",
    },
    {
      "image": "assets/images/sj.png",
      "title": "SJ",
    },
    {
      "image": "assets/images/viz.png",
      "title": "VIZ",
    },
  ];

  final List<Map<String, String>> collections = [
    {
      "image": "assets/images/death-note.jpg",
      "title": "Death Note",
    },
    {
      "image": "assets/images/attack-on-titans.jpg",
      "title": "Attack On Titans",
    },
    {
      "image": "assets/images/demon-slayer.jpg",
      "title": "Demon Slayer",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          CarouselWithDotsPage(
            imgList: collections,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: double.infinity,
              child: const Text(
                "مجموعه برندهای محصولات ما",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: brands.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1.0, color: Colors.red),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        brands[index]["image"]!,
                        height: 100,
                        // width: 100,
                      ),
                      Text(
                        brands[index]["title"]!,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselWithDotsPage extends StatefulWidget {
  final List<Map<String, String>> imgList;

  const CarouselWithDotsPage({Key? key, required this.imgList})
      : super(key: key);

  @override
  _CarouselWithDotsPageState createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList
        .map((item) => ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    item["image"]!,
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        item["title"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.map((url) {
            int index = widget.imgList.indexOf(url);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
