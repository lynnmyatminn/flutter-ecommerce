import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/JTCProductsScreen.dart';
import 'package:flutter_ecommerce_app/screens/JTCSubCategoryScreen.dart';

class GridTilesJTCCategory extends StatelessWidget {
  int id;
  int subid;
  String name;
  String imageUrl;
  // String slug;
  bool fromSubProducts = false;

  String curPageNo = "1";
  String menuSearch = "xxx";
  String keyWord = "xxx";
  String colorGradeID = "0";
  String shapeID = "0";
  String origin = "xxx";
  String weight = "0";
  String price = "0";
  String sort = "xxx";

  GridTilesJTCCategory(
      {Key key,
      @required this.id,
      this.subid,
      @required this.name,
      @required this.imageUrl,
      // @required this.slug,
      this.fromSubProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (fromSubProducts) {
          // print(slug);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JTCProductsScreen(
                      slug:
                          "Product/GetProductTest/${curPageNo}/${menuSearch}/${keyWord}/${colorGradeID}/${shapeID}/${origin}/${weight}/${price}/${sort}/${id.toString()}/${subid.toString()}",
                      name: name,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JTCSubCategoryScreen(
                      slug: id.toString(),
                    )),
          );
        }
      },
      child: Card(
          color: Colors.white,
          elevation: 0,
          child: Center(
            child: Column(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Roboto-Light.ttf',
                        fontSize: 12,
                        fontWeight: FontWeight.bold))
              ],
            ),
          )),
    );
  }
}
