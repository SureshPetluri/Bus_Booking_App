import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _introData = [
    {
      "image": "images/bus1.png",
      "title": "Find Your Bus",
      "description":
          "Quickly find buses for your preferred routes and destinations. Compare schedules to pick the most convenient options. Enjoy real-time updates and the best prices to plan your journey effortlessly."
    },
    {
      "image": "images/bus.png",
      "title": "Choose Your Seat",
      "description":
          "Select your preferred seat with ease and comfort. View seat layouts and pick the one that suits you best. Ensure a comfortable journey with your favorite seat."
    },
    {
      "image": "images/bus1.png",
      "title": "Enjoy Your Trip",
      "description":
          "Experience a smooth and enjoyable journey with our reliable service. Track your bus in real-time and stay informed about your travel status. We make sure your trip is hassle-free and pleasant."
    },
  ];

  void _onSkip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _next() {
    if (_currentIndex == _introData.length - 1) {
      _onSkip();
    } else {
      setState(() {
        moveToNextCarousel();
        _currentIndex = (_currentIndex + 1) % _introData.length;
      });
    }
  }

  void _previous() {
    if (_currentIndex == 0) {
    } else {
      setState(() {
        moveToPreviousCarousel();
        _currentIndex =
            (_currentIndex - 1 + _introData.length) % _introData.length;
      });
    }
  }

  CarouselController carouselController = CarouselController();

  moveToPreviousCarousel() {
    carouselController.previousPage(
        duration: const Duration(seconds: 2), curve: Curves.easeIn);
  }

  moveToNextCarousel() {
    carouselController.nextPage(
        duration: const Duration(seconds: 2), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: _introData.length,
              itemBuilder: (context, index, realIndex) {
                final item = _introData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item["image"]!, height: 300),
                    SizedBox(height: 20),
                    Text(
                      item["title"]!,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        item["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 2),
                height: double.infinity,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _introData.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _currentIndex = entry.key,
                child: Container(
                  width:_currentIndex == entry.key?15: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _currentIndex == 0 ? null : _previous,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50),
                  ),
                  child: const Text("Previous"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _next,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                  ),
                  child: Text(_currentIndex == _introData.length - 1
                      ? "Get Started"
                      : "Next"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
