import 'package:cozy_app/Colors.dart';
import 'package:cozy_app/home/bottom_menu.dart';
import 'package:cozy_app/home/popular_cities.dart';
import 'package:cozy_app/home/recommended_space.dart';
import 'package:cozy_app/home/tips_guidance.dart';
import 'package:cozy_app/provider/SpaceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _loadSpace(BuildContext context) {
    Provider.of<SpaceProvider>(context, listen: false).getRecommendedSpace();
  }

  @override
  Widget build(BuildContext context) {
    _loadSpace(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _header(),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: PopularCity(),
            ),
            const SizedBox(
              height: 31,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Consumer<SpaceProvider>(
                  builder: (context, provider, child) {
                    if (provider.spaces.length > 0) {
                      return RecommendedSpace(provider.spaces);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TipsGuidance(),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: const BottomMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore Now",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Mencari kosan yang cozy",
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
