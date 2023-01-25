import 'dart:async';
import 'package:air_duka_interview/screen_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController _anime_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const anime_duration = 2;

    _anime_controller = AnimationController(
        duration: const Duration(seconds: anime_duration),
        reverseDuration: Duration(seconds: anime_duration),
        vsync: this);
    animation = Tween<double>(begin: 10, end: 56).animate(_anime_controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _anime_controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _anime_controller.forward();
      }
    });
    _anime_controller.forward();
  }

  _move_to_next() {
    const duration = 3;

    Timer(Duration(seconds: duration), () async {

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => ScreenHomepage(),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {

    _move_to_next();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Container(
                      height: animation.value,
                      width: animation.value,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                        height: animation.value,
                        width: animation.value,
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AirDuka Interview',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '@benson machira',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _anime_controller.dispose();
    super.dispose();
  }
}
