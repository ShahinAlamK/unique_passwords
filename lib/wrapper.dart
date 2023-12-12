import 'package:flutter/material.dart';
import 'package:uniqe_passwords/pages/home/home_page.dart';
import 'package:uniqe_passwords/pages/splash/splash_page.dart';
import 'package:uniqe_passwords/utils/constants/size_config.dart';
import 'package:uniqe_passwords/utils/themes/theme.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: PTheme.lightTheme,
      initialRoute: "/",
      routes: {
        "/":(context)=>const SplashPage(),
        "/homePage":(context)=>const HomePage()
      },
    );
  }
}
