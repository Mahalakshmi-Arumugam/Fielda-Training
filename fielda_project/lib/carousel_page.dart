import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fielda_project/models/button_style.dart';
import 'package:fielda_project/models/images_data.dart';
import 'package:fielda_project/sign_in.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _currentIndex = 0;

   @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white, 
              child: CarouselSlider(
                items: ImageData.images.map((imageData) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 700.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            top: 60.0, bottom: 20.0),
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
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ImageData.images.asMap().entries.map((entry) {
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
                      color: _currentIndex == entry.key
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyles.primaryButtonStyle.copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: Text(
                  'I am New Here',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              },
              style: ButtonStyles.primaryButtonStyle.copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.white),
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
      ),
    );
  }
}
