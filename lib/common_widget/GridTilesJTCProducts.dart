import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/JTCProductDetailScreen.dart';
import 'package:flutter_ecommerce_app/screens/JTCProductsScreen.dart';
import 'package:flutter_ecommerce_app/screens/JTCSubCategoryScreen.dart';

class GridTilesJTCProducts extends StatelessWidget {
  String id;
  String name;
  String imageUrl;
  String slug;
  String price;
  bool fromSubProducts = false;

  GridTilesJTCProducts(
      {Key key,
      @required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.slug,
      @required this.price,
      this.fromSubProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(imageUrl);

    return InkWell(
      onTap: () {
        /* if (fromSubProducts) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsScreen(
                      slug: "products/?page=1&limit=12&category=" + slug,
                      name: name,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategoryScreen(
                      slug: slug,
                    )),
          );
        }*/
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JTCProductDetailScreen(
                    slug: "Product/GetAllProductsByID/" + id + "/",
                  )),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 5),
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            elevation: 0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.network(
                    imageUrl,
                    width: 150,
                    height: 150,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Text(
                        (name.length <= 40 ? name : name.substring(0, 40)),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text("৳  ${(price != null) ? price : 'Unavailable'}",
                        style: TextStyle(
                            color: (price != null)
                                ? Color(0xFFf67426)
                                : Color(0xFF0dc2cd),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
