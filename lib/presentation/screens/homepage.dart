import 'package:flutter/material.dart';
import 'package:my_portfolio/theme_logic/cubit/theme_cubit.dart';
import 'package:my_portfolio/presentation/utils/utility.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isDark = true;

  double scrollOffset = 0.0;
  double section1Value = 0;
  double section2Value = 0;
  double section3Value = 0;
  double section4Value = 0;

  AnimationController goToTopAnimationController;
  ScrollController _scrollController;
  ScrollController _workSC;

  @override
  void initState() {
    super.initState();
    //Theme check
    isDark = AppTheme.currentSystemBrightness == Brightness.dark ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: screenHeight(context),
        width: screenWidth(context),
        color: theme.backgroundColor,
        child: Stack(
          children: [
            Positioned(
              top: 20.h,
              right: 20.h,
              child: Container(
                padding: kPadding10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.accentColor,
                ),
                child: InkWell(
                  onTap: () {
                    context.read<ThemeCubit>().setThisTheme(
                        isDark ? ThemeMode.light : ThemeMode.dark);
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  child: Center(
                    child: Icon(
                      isDark ? Icons.wb_sunny_outlined : Icons.dark_mode,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
