import 'package:cozy_app/colors.dart';
import 'package:cozy_app/detail/detail_page.dart';
import 'package:flutter/material.dart';

class Space {
  String name;
  String imageUrl;
  String city;
  String country;
  int price;
  int rating;

  Space(this.name, this.imageUrl, this.city, this.country, this.price,
      this.rating);
}

class RecommendedSpace extends StatelessWidget {
  List<Space> spaces = [
    Space(
        "Kuretakeso Hott", "assets/space1.png", "Bandung", "Indonesia", 52, 4),
    Space("Roemah Nenek", "assets/space2.png", "Bogor", "Indonesia", 11, 5),
    Space("Darrling How", "assets/space3.png", "Bandung", "Indonesia", 52, 4),
    Space(
        "Kuretakeso Hott", "assets/space1.png", "Bandung", "Indonesia", 52, 4),
    Space("Kuretakeso Hott", "assets/space1.png", "Bandung", "Indonesia", 52, 4)
  ];

  RecommendedSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended Space",
          style: regularTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 15),
        ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(),
                  ),
                );
              },
              child: _spaceCard(spaces[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 30);
          },
          itemCount: spaces.length,
        )
      ],
    );
  }

  Widget _spaceCard(Space space) {
    return Row(
      children: [
        Container(
          width: 130,
          height: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              children: [
                Image.asset(space.imageUrl),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                        color: purplerColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon_star_fill.png",
                          width: 18,
                          height: 18,
                        ),
                        Text(
                          "${space.rating}/5",
                          style: whiteTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              space.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            Text.rich(
              TextSpan(
                text: "\$${space.price}",
                style: purpleTextStyle.copyWith(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: " / month",
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "${space.city}, ${space.country}",
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        )
      ],
    );
  }
}
