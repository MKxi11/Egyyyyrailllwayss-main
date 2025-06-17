import 'package:egyrailwayes/screens/Start/welcome.dart';
import 'package:flutter/material.dart';
import 'package:animated_introduction/animated_introduction.dart';

class Onbroading extends StatefulWidget {
  const Onbroading({super.key});

  @override
  State<Onbroading> createState() => _PackageState();
}

class _PackageState extends State<Onbroading> {
  final List<SingleIntroScreen> pages = [
    const SingleIntroScreen(
      mainCircleBgColor: Color(0xff0057FF),
      sideDotsBgColor: Color(0xff0057FF),
      title: 'The best train booking app',

      description: "",
      // 'Easily search, book, and manage your train journeys all in one place. Enjoy a smooth booking experience. ',
      imageAsset: 'images/mobile-apps.png',
    ),
    const SingleIntroScreen(
      mainCircleBgColor: Color(0xff0057FF),
      sideDotsBgColor: Color(0xff0057FF),
      title: 'Book tickets easily and quickly',
      description: "",
      // 'Plan your journey with real-time schedules, easy seat selection, and instant ticket access anytime and anywhere.',
      imageAsset: 'images/booking.png',
    ),
    const SingleIntroScreen(
      mainCircleBgColor: Color(0xff0057FF),
      sideDotsBgColor: Color(0xff0057FF),
      title: 'Let’s start your journey',
      description: "",
      // 'Your journey begins here fast, easy, and in your hands. Plan, book, and board with confidence, all through one smart app. ',
      imageAsset: 'images/journey.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
        onSkip: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Welcome(),
          ));
        },
        doneText: "Next",
        footerBgColor: Color(0xff0057FF),
        slides: pages,
        indicatorType: IndicatorType.circle,
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Welcome(),
            ),
          );
        },
      ),
    );
  }
}
