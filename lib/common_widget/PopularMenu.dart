import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PopularMenu extends StatelessWidget {
  double width, height = 55.0;
  double customFontSize = 13;
  String defaultFontFamily = 'Roboto-Light.ttf';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  // child: Icon(
                  //   Icons.account_balance,
                  //   color: Color(0xFFAB436B),
                  // ),
                  child: Image.asset("assets/images/FineRubyR.png",
                      height: 150, width: 100),
                ),
              ),
              Text(
                "Fine Ruby",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: 'Roboto-Light.ttf',
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  // child: Icon(
                  //   FontAwesomeIcons.clock,
                  //   color: Color(0xFFC1A17C),
                  // ),
                  child: Image.asset("assets/images/FineRubyR.png",
                      height: 150, width: 100),
                ),
              ),
              Text(
                "Flash Sell",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Image.asset("assets/images/FineRubyR.png",
                      height: 150, width: 100),
                ),
              ),
              Text(
                "Evaly Store",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Image.asset("assets/images/FineRubyR.png",
                      height: 150, width: 100),
                ),
              ),
              Text(
                "Voucher",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          )
        ],
      ),
    );
  }
}
