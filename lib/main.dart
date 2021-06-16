import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_portfolio/presentation/screens/homepage.dart';
import 'package:my_portfolio/presentation/utils/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/src/provider.dart';

import 'logic/cubit/theme_cubit.dart';
import 'presentation/utils/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HydratedCubit.storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: Portfolio(),
    );
  }
}

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(constraints,
            designSize: const Size(1920, 1080), allowFontScaling: true);
        return MaterialApp(
          title: 'Deepanshu Chowdhary',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: context
              .select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
          home: HomePage(),
          // home: SplashView(),
        );
      },
    );
  }
}
