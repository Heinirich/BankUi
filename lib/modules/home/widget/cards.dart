import 'package:bank_ui/constants/color_constant.dart';
import 'package:bank_ui/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BankCards extends StatelessWidget {
  const BankCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 199,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left:16,right:6),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10),
              height: 199,
              width: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color(cards[index].cardBackground)
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(child: SvgPicture.asset(cards[index].cardElementTop) ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SvgPicture.asset(cards[index].cardElementBottom) ),
                    Positioned(
                      left: 29,
                      top: 48,
                      child: Text('CARD NUMBER',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor

                      ),
                      ) 
                    ),
                    Positioned(
                      left: 29,
                      top: 65,
                      child: Text(cards[index].cardNumber,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor

                      ),
                      ) 
                    ),
                    Positioned(
                      right: 10,
                      top: 35,
                      child: Image.asset(cards[index].cardType,
                      width: 60,
                      height: 60,
                      ),
                    ),
                    Positioned(
                      left: 29,
                      bottom: 45,
                      child: Text('CARD HOLDERNAME',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor

                      ),
                      ) 
                    ),
                    Positioned(
                      left: 29,
                      bottom: 21,
                      child: Text(cards[index].user,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor

                      ),
                      ) 
                    ),
                    Positioned(
                      left: 180,
                      bottom: 45,
                      child: Text('EXPIRY',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor

                      ),
                      ) 
                    ),
                    Positioned(
                      left: 180,
                      bottom: 21,
                      child: Text(cards[index].cardExpired,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor

                      ),
                      ) 
                    ),

                ]
              ),
            );
          }),
    );
  }
}
