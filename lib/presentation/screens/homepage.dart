import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/logic/cubit/theme_cubit.dart';
import 'package:my_portfolio/presentation/utils/utility.dart';
import 'package:my_portfolio/presentation/utils/space.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double menuH = 100.h;
  double menuW = 100.h;
  // bool menuOpen = false;

  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

// void _handleOnPressed() {
//   setState(() {
//     isPlaying = !isPlaying;
//     isPlaying
//         ? _animationController.forward()
//         : _animationController.reverse();
//   });
// }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: screenHeight(context),
        width: screenWidth(context),
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This is a sample text",
                  style: TextStyle(color: theme.primaryColor, fontSize: 50),
                ),
                verticalSpaceMassive,
                TextButton(
                    onPressed: () {
                      context.read<ThemeCubit>().setThisTheme(ThemeMode.light);
                    },
                    child: Text(
                      "Light",
                      style: TextStyle(color: theme.accentColor, fontSize: 30),
                    )),
                verticalSpaceLarge,
                TextButton(
                    onPressed: () {
                      context.read<ThemeCubit>().setThisTheme(ThemeMode.dark);
                    },
                    child: Text(
                      "Dark",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 30),
                    ))
              ],
            ),
            Positioned(
              top: 20.h,
              left: 20.w,
              child: AnimatedContainer(
                padding: EdgeInsets.all(10),
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                height: menuH,
                width: menuW,
                decoration: BoxDecoration(
                  color: theme.accentColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: ListView(
                        children: [
                          verticalSpaceMassive,
                          verticalSpaceLarge,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                color: theme.primaryColorLight,
                                height: 200.h,
                                width: 200.h,
                              ),
                              Container(
                                color: theme.primaryColorLight,
                                height: 200.h,
                                width: 200.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isPlaying = !isPlaying;
                                isPlaying
                                    ? _animationController.forward()
                                    : _animationController.reverse();

                                menuH = isPlaying ? 700.h : 100.h;
                                menuW = isPlaying ? 700.w : 100.h;
                              });
                            },
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              progress: _animationController,
                            ),
                            iconSize: 50.sp,
                            color: Colors.black,
                          ),
                          horizontalSpaceMedium25,
                          Text(
                            "Menu",
                            style: text50,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
