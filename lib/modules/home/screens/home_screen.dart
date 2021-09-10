import 'package:bank_ui/constants/color_constant.dart';
import 'package:bank_ui/models/operation_model.dart';
import 'package:bank_ui/models/transaction_model.dart';
import 'package:bank_ui/modules/home/widget/cards.dart';
import 'package:bank_ui/modules/home/widget/welcome.dart';
import 'package:bank_ui/modules/shared/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  //HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  //Handler Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 8),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              //custom bar
              CustomAppBar(),
              SizedBox(
                height: 25,
              ),
              Welcome(),
              SizedBox(
                height: 10,
              ),
              BankCards(),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Operations',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor,
                        )),
                    Row(
                      children: map<Widget>(
                        datas,
                        (index, selected) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 9,
                            width: 9,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: current == index
                                    ? kBlueColor
                                    : kTwentyBlueColor),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 123,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 16),
                      itemCount: datas.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OperationCard(
                            operation: datas[index].name,
                            selectedIcon: datas[index].selectedIcon,
                            unselectedIcon: datas[index].unselectedIcon,
                            isSelected: current == index,
                            context: this);
                      })),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: <Widget>[
                  Text('Transaction Histories',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kBlackColor,
                      ))
                ]),
              ),
              ListView.builder(
                  itemCount: transactions.length,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 76,
                      margin: EdgeInsets.only(bottom: 13),
                      padding: EdgeInsets.only(
                          left: 24, top: 12, bottom: 12, right: 22),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: kTenBlackColor,
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(8.0, 8.0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 57,
                                width: 57,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(transactions[index].photo),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    transactions[index].name,
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: kBlackColor),
                                  ),
                                  Text(
                                    transactions[index].date,
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: kGreyColor),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(transactions[index].amount, style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: kBlueColor
                              ),)
                            ],
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  _HomeScreenState context;

  OperationCard(
      {required this.operation,
      required this.selectedIcon,
      required this.unselectedIcon,
      required this.isSelected,
      required this.context});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 123,
      height: 123,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kTenBlackColor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(8.0, 8.0),
            )
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected ? kBlueColor : kWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
              widget.isSelected ? widget.selectedIcon : widget.unselectedIcon),
          SizedBox(
            height: 9,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? kWhiteColor : kBlueColor),
          )
        ],
      ),
    );
  }
}
