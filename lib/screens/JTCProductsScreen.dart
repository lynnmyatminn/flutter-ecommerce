import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widget/AppBarWidget.dart';
import 'package:flutter_ecommerce_app/common_widget/CircularProgress.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesCategory.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesProducts.dart';
import 'package:flutter_ecommerce_app/models/JTCProductsModel.dart';
import 'package:flutter_ecommerce_app/utils/Urls.dart';
import 'package:http/http.dart';

class JTCProductsScreen extends StatefulWidget {
  String name;
  String slug;

  JTCProductsScreen({Key key, @required this.name, @required this.slug})
      : super(key: key);

  @override
  _JTCProductsScreenState createState() => _JTCProductsScreenState();
}

class _JTCProductsScreenState extends State<JTCProductsScreen> {
  @override
  Widget build(BuildContext context) {
    print('${widget.slug}, ${widget.name}');
    return Scaffold(
      appBar: appBarWidget(context),
      body: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: JTCProductListWidget(
            slug: widget.slug,
          )),
    );
  }
}

class JTCProductListWidget extends StatelessWidget {
  String slug;

  JTCProductListWidget({Key key, this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getJTCProductList(slug, false),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgress();
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );
  }
}

JTCProductsModels products;

Future<JTCProductsModels> getJTCProductList(String slug, bool isSubList) async {
  print(isSubList);

  if (isSubList) {
    products = null;
  }
  if (products == null) {
    Response response;
    response = await get(Urls.JTC_URL + slug);
    int statusCode = response.statusCode;
    print(statusCode);
    final body = json.decode(response.body);
    if (statusCode == 200) {
      products = JTCProductsModels.fromJson(body);
      return products;
    } else {
      return products = JTCProductsModels();
    }
  } else {
    return products;
  }
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  JTCProductsModels values = snapshot.data;
  List<Results> results = values.results;
  return GridView.count(
    crossAxisCount: 2,
//    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 12.0,
    children: List<Widget>.generate(results.length, (index) {
      return GridTile(
          child: GridTilesProducts(
        name: results[index].gemtitle,
        imageUrl: results[index].productImage,
        slug: results[index].gemcode,
        // price: results[index].sellingPrice,
        price: "0",
      ));
    }),
  );
}
