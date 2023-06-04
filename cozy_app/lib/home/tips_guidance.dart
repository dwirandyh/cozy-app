import 'package:cozy_app/Colors.dart';
import 'package:flutter/material.dart';

class TipsGuidance extends StatelessWidget {
  const TipsGuidance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tips & Guidance",
          style: regularTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _itemWidget("City Guidelines", "Updated 20 Apr", "assets/tips1.png"),
        const SizedBox(
          height: 20,
        ),
        _itemWidget("Jakarta Fairship", "Updated 11 Dec", "assets/tips2.png")
      ],
    );
  }

  Widget _itemWidget(
    String title,
    String lastUpdate,
    String image,
  ) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Text(
              lastUpdate,
              style: greyTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right_outlined,
            color: greyColor,
          ),
        )
      ],
    );
  }
}
