import 'package:cozy_app/colors.dart';
import 'package:flutter/widgets.dart';

class City {
  String name;
  String imageUrl;
  bool isFavorite;

  City(this.name, this.imageUrl, {this.isFavorite = false});
}

class PopularCity extends StatelessWidget {
  List<City> cities = [
    City("Jakarta", "assets/city1.png"),
    City("Bandung", "assets/city2.png", isFavorite: true),
    City("Surabaya", "assets/city3.png"),
    City("Palembang", "assets/city4.png"),
    City("Aceh", "assets/city5.png", isFavorite: true),
    City("Bogor", "assets/city6.png"),
  ];

  PopularCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Cities",
          style: regularTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20);
            },
            scrollDirection: Axis.horizontal,
            itemCount: cities.length,
            itemBuilder: (BuildContext context, int index) {
              return _cityCard(cities[index]);
            },
          ),
        )
      ],
    );
  }

  Widget _cityCard(City city) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        height: 150,
        color: whiteLightColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                ),
                city.isFavorite
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                              ),
                              color: purplerColor),
                          child: Center(
                            child: Image.asset(
                              "assets/icon_star_fill.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 13,
            )
          ],
        ),
      ),
    );
  }
}
