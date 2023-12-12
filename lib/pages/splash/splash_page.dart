import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).whenComplete((){
      Navigator.pushNamedAndRemoveUntil(context, "/homePage", (route) => false);
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height*.25),
            Lottie.asset(
              fit: BoxFit.cover,
              height: size.width*.70,
                "assets/animation.json"),

            Text("Unique Password Generator".toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white
              ),),
            const Spacer(),

            Text("Version 1.0.2",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade300),),

            SizedBox(height: size.height*.02,),

          ],
        ),
      ),
    );
  }
}
