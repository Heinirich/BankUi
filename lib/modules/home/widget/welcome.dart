import 'package:bank_ui/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Good Morning",
            style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: kBlackColor),
          ),
          Text('Amanda Alex',
              style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor))
        ],
      ),
    );
  }
}

