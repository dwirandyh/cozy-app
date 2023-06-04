import 'package:cozy_app/Colors.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width - 38,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F8),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _menuItem("assets/icon_home_solid.png", true),
          _menuItem("assets/icon_mail_solid.png", false),
          _menuItem("assets/icon_card_solid.png", false),
          _menuItem("assets/icon_love_solid.png", false),
        ],
      ),
    );
  }

  Widget _menuItem(String imageUrl, bool isActive) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
          height: 26,
          color: isActive ? purplerColor : greyColor,
        ),
        const Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: purplerColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(
                height: 4,
              )
      ],
    );
  }
}
