import 'package:cozy_app/detail/space_detail.dart';
import 'package:cozy_app/model/space.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

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
              child: SpaceDetail(widget.space),
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
          widget.space.imageUrl,
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
                InkWell(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Image.asset(
                    isFavorite
                        ? "assets/btn_wishlist_filled.png"
                        : "assets/btn_wishlist.png",
                    width: 40,
                    height: 40,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
