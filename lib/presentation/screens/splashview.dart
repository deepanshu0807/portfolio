import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/utils/utility.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'homepage.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  double bPos = 0;
  double tPos = 0;
  double lPos = 0;
  double rPos = 0;
  double mainR = 0;

  Animation _color;
  AnimationController _colorController;

  @override
  void initState() {
    _colorController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _color = ColorTween(begin: Colors.white, end: AppColors.getSecondaryColor())
        .animate(_colorController);

    _beginProgressAnim();
    super.initState();
  }

  _beginProgressAnim() {
    Timer(Duration(seconds: 0), () {
      _colorController.forward();
    });
  }

  @override
  void didChangeDependencies() {
    startTimeout();
    startAnim1Time();
    startAnim2Time();
    startAnim1Time2();
    startAnim2Time2();
    startMainAnimTime();
    super.didChangeDependencies();
  }

  animateFirstContainer() {
    if (mounted) {
      setState(() {
        bPos = screenHeight(context) / 1.3;
      });
    }
  }

  animateSecondContainer() {
    if (mounted) {
      setState(() {
        tPos = screenHeight(context) / 1.3;
      });
    }
  }

  animateFirstContainer2() {
    if (mounted) {
      setState(() {
        lPos = screenWidth(context);
      });
    }
  }

  animateSecondContainer2() {
    if (mounted) {
      setState(() {
        rPos = screenWidth(context);
      });
    }
  }

  animateMainContainer() {
    if (mounted) {
      setState(() {
        mainR = screenWidth(context);
      });
    }
  }

  startMainAnimTime() {
    return Timer(Duration(seconds: 6), animateMainContainer);
  }

  startAnim1Time() {
    return Timer(Duration(seconds: 2), animateFirstContainer);
  }

  startAnim2Time() {
    return Timer(Duration(seconds: 2), animateSecondContainer);
  }

  startAnim1Time2() {
    return Timer(Duration(seconds: 3), animateFirstContainer2);
  }

  startAnim2Time2() {
    return Timer(Duration(seconds: 3), animateSecondContainer2);
  }

  startTimeout() {
    return Timer(Duration(milliseconds: 6000), changeScreen);
  }

  changeScreen() {
    Navigator.of(context).pushReplacement(_createRoute());
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = screenWidth(context) > 600 ? false : true;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 1500),
            curve: Curves.decelerate,
            top: 0,
            bottom: bPos,
            left: lPos,
            right: 0,
            child: Container(
              height: screenHeight(context),
              width: screenWidth(context),
              color: AppColors.getSecondaryColor(),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1500),
            curve: Curves.decelerate,
            top: tPos,
            bottom: 0,
            left: 0,
            right: rPos,
            child: Container(
              height: screenHeight(context),
              width: screenWidth(context),
              color: AppColors.getSecondaryColor(),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            top: 0,
            bottom: 0,
            left: 0,
            right: mainR,
            child: Container(
              //color: AppColors.getBackgroundColor(),
              height: screenHeight(context),
              width:
                  isMobile ? screenWidth(context) / 1.3 : screenWidth(context),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  AnimatedBuilder(
                      animation: _colorController,
                      builder: (context, snapshot) {
                        return Center(
                          child: RotateAnimatedTextKit(
                              onTap: () {},
                              text: [' Hello there', ' Welcome '],
                              duration: Duration(milliseconds: 3000),
                              pause: Duration(milliseconds: 1000),
                              textStyle: textBungee.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: _color.value,
                                  fontSize: isMobile ? 35 : 80.sp),
                              textAlign: TextAlign.center),
                        );
                      }),
                  Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedBuilder(
                              animation: _colorController,
                              builder: (context, snapshot) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 100.w),
                                  child: new LinearPercentIndicator(
                                    width: screenWidth(context) / 2.2,
                                    animation: true,
                                    lineHeight: 25.0,
                                    animationDuration: 6000,
                                    percent: 1.0,
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: _color.value,
                                  ),
                                );
                              }),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.decelerate;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
