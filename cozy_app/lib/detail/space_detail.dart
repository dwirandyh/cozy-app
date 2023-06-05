import 'package:cozy_app/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class SpaceDetail extends StatelessWidget {
  const SpaceDetail({Key? key}) : super(key: key);

  _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception("Can not launch ${url}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, top: 30, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleSection(),
                SizedBox(
                  height: 30,
                ),
                _facilitySection(),
                SizedBox(
                  height: 30,
                ),
                _photos(),
                SizedBox(
                  height: 30,
                ),
                _location("Jln. Kappan Sukses No. 20\nPalembang"),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      _launchUrl("tel:+62890832343");
                    },
                    child: Text("Book Now"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: whiteColor,
                      backgroundColor: purplerColor,
                      textStyle: whiteTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _titleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kuretakeso Hott",
              style: blackTextStyle.copyWith(fontSize: 22),
            ),
            SizedBox(
              height: 4,
            ),
            Text.rich(
              TextSpan(
                text: "\$52",
                style: purpleTextStyle.copyWith(fontSize: 16),
                children: [
                  TextSpan(
                    text: " / month",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
        _star(4),
      ],
    );
  }

  Widget _facilitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Main Facilities",
          style: regularTextStyle.copyWith(fontSize: 16),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _facilityItem("kitchen", 2, "assets/icon_kitchen.png"),
            _facilityItem("bedroom", 3, "assets/icon_bedroom.png"),
            _facilityItem("wardrobe", 3, "assets/icon_wardrobe.png"),
          ],
        )
      ],
    );
  }

  Widget _facilityItem(String type, int count, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: 32,
          height: 32,
        ),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: "$count",
            style: purpleTextStyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: type,
                style: greyTextStyle.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _photos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Photos",
          style: regularTextStyle.copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 88,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _photoThumbnail(
                "assets/photo_1.png",
              ),
              SizedBox(width: 18),
              _photoThumbnail(
                "assets/photo_2.png",
              ),
              SizedBox(width: 18),
              _photoThumbnail(
                "assets/photo_3.png",
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _photoThumbnail(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      child: Container(
        child: Image.asset(
          image,
          width: 110,
          height: 88,
        ),
      ),
    );
  }

  Widget _location(String address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: regularTextStyle.copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              address,
              style: greyTextStyle.copyWith(fontSize: 14),
            ),
            InkWell(
              onTap: () {
                _launchUrl(
                    "https://www.google.com/maps/place/Hotel+Kuretakeso+Kemang/@-6.2540649,106.8141966,15z");
              },
              child: Image.asset(
                "assets/btn_map.png",
                width: 40,
                height: 40,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _star(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(
        Image.asset(
          "assets/icon_star${rating - 1 < i ? "" : "_fill"}.png",
          width: 20,
          height: 20,
        ),
      );
    }
    return Row(
      children: stars,
    );
  }
}
