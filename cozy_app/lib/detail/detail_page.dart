import 'package:cozy_app/detail/space_detail.dart';
import 'package:cozy_app/model/space.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            _thumbnail(context),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SpaceDetail(space),
            ),
          ],
        ),
      ),
    );
  }

  Widget _thumbnail(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          space.imageUrl,
          height: 350,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/btn_back.png",
                    width: 40,
                    height: 40,
                  ),
                ),
                Image.asset(
                  "assets/btn_wishlist.png",
                  width: 40,
                  height: 40,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
