import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/movies');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/movie.png'),
            Text("Movie Time",
                style: TextStyle(
                    color: Colors.red.shade500,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1)),
          ],
        ),
      ),
    );
  }
}
