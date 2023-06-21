import 'package:cozy_app/Colors.dart';
import 'package:cozy_app/error/error_page.dart';
import 'package:cozy_app/model/space.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpaceDetail extends StatelessWidget {
  Space space;

  SpaceDetail(this.space);

  _launchUrl(BuildContext context, String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ),
      );
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
                const SizedBox(
                  height: 30,
                ),
                _facilitySection(),
                const SizedBox(
                  height: 30,
                ),
                _photos(),
                const SizedBox(
                  height: 30,
                ),
                _location(context),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      _launchUrl(context, "tel:${space.phone}");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: whiteColor,
                      backgroundColor: purplerColor,
                      textStyle: whiteTextStyle.copyWith(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text("Book Now"),
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
              space.name,
              style: blackTextStyle.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 4,
            ),
            Text.rich(
              TextSpan(
                text: "\$${space.price}",
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
        _star(space.rating),
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
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _facilityItem(
                "Kitchen", space.numberOfKitchens, "assets/icon_kitchen.png"),
            _facilityItem(
                "Bedroom", space.numberOfBedrooms, "assets/icon_bedroom.png"),
            _facilityItem("Cupboards", space.numberOfCupboards,
                "assets/icon_wardrobe.png"),
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
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: "$count ",
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
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 88,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _photoThumbnail(space.photos[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8);
            },
            itemCount: space.photos.length,
          ),
        )
      ],
    );
  }

  Widget _photoThumbnail(String imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: Container(
        child: Image.network(
          imageUrl,
          width: 110,
          height: 88,
          fit: BoxFit.fill,
          errorBuilder: (
            BuildContext context,
            Object exception,
            StackTrace? stackTrace,
          ) {
            // Handle the error without rethrowing
            // For example, return a placeholder image
            return Image.asset('assets/photo_1.png');
          },
        ),
      ),
    );
  }

  Widget _location(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: regularTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${space.address}\n${space.city}",
              style: greyTextStyle.copyWith(fontSize: 14),
            ),
            InkWell(
              onTap: () {
                _launchUrl(context, space.mapUrl);
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
