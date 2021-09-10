import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Drawer();
                  print("Drawer Tap");
                },
                child: SvgPicture.asset('assets/svg/drawer_icon.svg')),
            Container(
              height: 59,
              width: 59,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/user_image.png'))),
            )
          ],
        ));
  }
}

