import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselPage extends StatefulWidget {
  final List<Map<String, dynamic>> images = [
   {
      'path': 'assets/images/one.png',
      'width': 300.0,
      'height': 300.0,
      'text1': 'Track your work',
      'text2': 'Monitor, Track and Map field work\n Anywhere, Anytime'
    },
    {
      'path': 'assets/images/second.png',
      'width': 300.0,
      'height': 300.0,
      'text1': 'Add real-world detail',
      'text2': 'No Paper Trails, Stay real-time,\n Stay mobile'
    },
    {
      'path': 'assets/images/third.png',
      'width': 300.0,
      'height': 300.0,
      'text1': 'Stay connected',
      'text2': 'Leverage GIS for tracking\n your activity'
    },
  ];


  CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items: widget.images.map((imageData) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: 500.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 40.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          imageData['path'],
                          width: imageData['width'],
                          height: imageData['height'],
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 15.0),
                        Text(
                          imageData['text1'],
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              imageData['text2'],
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 500.0,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = entry.key;
                  });
                },
                child: Container(
                  width: 9.0,
                  height: 9.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == entry.key ? Colors.blue : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.blue,
              side: const BorderSide(color: Colors.blue, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Text(
                'I am New Here',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.blue,
              side: const BorderSide(color: Colors.blue, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                'I Have an Account Already',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
