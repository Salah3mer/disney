import 'package:disney/core/utils/app_constants.dart';
import 'package:disney/feature/movies/presentation/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {

    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 470),
        vsync: this);
    controller.addStatusListener((state) async {
      if (state == AnimationStatus.completed) {
        controller.reset();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MovieScreen()));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstans.backgrondColor,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/disney_animation.json',
          controller: controller,
          repeat: false,
          onLoaded: (composition) {
            print(composition.duration);
            controller.duration=composition.duration;
            controller.forward();

          },
        ),
      ),
    );
  }
}
