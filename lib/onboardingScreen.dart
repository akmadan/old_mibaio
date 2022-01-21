import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              //useScrollView: true,
              titleWidget: Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 12, 0),
                child: Row(
                  children: [
                    Text(
                      "Seamless Control",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF4A80F0),
                          fontFamily: 'AvenirLTStdR',
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              bodyWidget: Text(
                "Effortlessly control your home from anywhere in the world",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'AvenirLTStdR',
                  fontSize: 18.0,
                ),
              ),
              image: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset(
                  'assets/onboard.png',
                  height: 1500,
                ),
              ),
            ),
            PageViewModel(
              // useScrollView: true,
              titleWidget: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    Text(
                      "Share house ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF4A80F0),
                          fontSize: 30,
                          fontFamily: 'AvenirLTStdR',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              bodyWidget: Text(
                "Share access to your home with guests and vistors effortlessly",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'AvenirLTStdR',
                  fontSize: 18.0,
                ),
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset(
                    'assets/onboard2.png',
                    height: 1500,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Step into the smart world",
                        style: TextStyle(
                            color: Color(0xFF4A80F0),
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'AvenirLTStdR'),
                      ),
                    ),
                  ],
                ),
              ),
              bodyWidget: Text(
                "Make all your devices smart, do more with your devices and make your life smarter",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                    fontFamily: 'AvenirLTStdR'),
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset(
                    'assets/onboard3.png',
                    height: 500,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    Text(
                      "Schedule your routine",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF4A80F0),
                          fontFamily: 'AvenirLTStdR',
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              bodyWidget: Text(
                "Set your device to work like clockwork with schedules",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'AvenirLTStdR',
                  fontSize: 18.0,
                ),
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset(
                    'assets/onboard4.png',
                    height: 500,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    Text(
                      "In-sync everywhere",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF4A80F0),
                          fontSize: 30,
                          fontFamily: 'AvenirLTStdR',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              bodyWidget: Text(
                "Control your home with any device, anywhere anytime",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'AvenirLTStdR',
                  fontSize: 18.0,
                ),
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SvgPicture.asset(
                    'assets/replacebulb.svg',
                    height: 500,
                  ),
                ),
              ),
              decoration: const PageDecoration(
                titleTextStyle:
                TextStyle(color: Color(0xFF4A80F0), fontSize: 30),
                bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
              ),
            ),
          ],
          onDone: () {
            Navigator.pushNamed(context, '/welcome');
          },
          onSkip: () {
            Navigator.pushNamed(context, '/welcome');
          },
          curve: Curves.easeInBack,
          skipColor: Color(0xFF4A80F0),
          initialPage: 0,
          animationDuration: 300,
          next: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color(0xFF4A80F0),
          ),
          skip: Text("Skip"),
          done: Icon(Icons.arrow_forward_ios),
          dotsDecorator: DotsDecorator(
            activeColor: Color(0xFF4A80F0),
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
        ),
      ),
    );
  }
}
