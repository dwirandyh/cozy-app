import 'package:cozy_app/Colors.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/splash_image.png")),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Find Cozy House\nto Stay and Happy",
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: whiteColor,
                        backgroundColor: purplerColor,
                        textStyle: whiteTextStyle.copyWith(fontSize: 18),
                      ),
                      onPressed: () {},
                      child: const Text("Explore Now"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
