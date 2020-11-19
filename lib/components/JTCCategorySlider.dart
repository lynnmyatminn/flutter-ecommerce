import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/JTCCategoryModel.dart';
import 'package:flutter_ecommerce_app/models/JTCSubCategoryModel.dart';
import 'package:flutter_ecommerce_app/common_widget/CircularProgress.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesJTCCategory.dart';
import 'package:flutter_ecommerce_app/utils/Urls.dart';
import 'package:http/http.dart';

List<JTCCategoryModel> jtccategories;
List<JTCSubCategoryModel> jtcsubcategories;

class JTCCategoryPage extends StatefulWidget {
  String slug;
  bool isSubList;

  JTCCategoryPage({Key key, this.slug, this.isSubList = false})
      : super(key: key);

  @override
  _JTCCategoryPageState createState() => _JTCCategoryPageState();
}

class _JTCCategoryPageState extends State<JTCCategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSubList) {
      return FutureBuilder(
        future: getJTCSubCategoryList(widget.slug, widget.isSubList),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgress();
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return createSubListView(context, snapshot, widget.isSubList);
          }
        },
      );
    } else {
      return FutureBuilder(
        future: getJTCCategoryList(widget.slug, widget.isSubList),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgress();
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return createListView(context, snapshot, widget.isSubList);
          }
        },
      );
    }
  }
}

Widget createListView(
    BuildContext context, AsyncSnapshot snapshot, bool isSubList) {
  List<JTCCategoryModel> values = snapshot.data;
  return GridView.count(
    crossAxisCount: 3,
//    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(values.length, (index) {
      return GridTile(
          child: GridTilesJTCCategory(
        id: values[index].id,
        subid: null,
        name: values[index].name,
        imageUrl: 'https://higem.pro/images-new/home/FineRubyR.jpg',
        // slug: 'Category/GetSubCategoryByCategory/' + values[index].id.toString(),
        fromSubProducts: isSubList,
      ));
    }),
  );
}

Widget createSubListView(
    BuildContext context, AsyncSnapshot snapshot, bool isSubList) {
  List<JTCSubCategoryModel> values = snapshot.data;
  return GridView.count(
    crossAxisCount: 3,
//    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(values.length, (index) {
      return GridTile(
          child: GridTilesJTCCategory(
        id: values[index].id,
        subid: values[index].subid,
        name: values[index].name,
        imageUrl: 'https://higem.pro/images-new/home/FineSapphireR.jpg',
        // slug: 'Category/GetSubCategoryByCategory/' + values[index].id.toString(),
        fromSubProducts: true,
      ));
    }),
  );
}

Future<List<JTCCategoryModel>> getJTCCategoryList(
    String slug, bool isSubList) async {
  if (isSubList) {
    jtccategories = null;
  }
  if (jtccategories == null) {
    Response response;
    response = await get(Urls.JTC_URL + slug);
    int statusCode = response.statusCode;
    final body = json.decode(response.body);
    if (statusCode == 200) {
      jtccategories =
          (body as List).map((i) => JTCCategoryModel.fromJson(i)).toList();

      return jtccategories;
    } else {
      return jtccategories = List();
    }
  } else {
    return jtccategories;
  }
}

Future<List<JTCSubCategoryModel>> getJTCSubCategoryList(
    String slug, bool isSubList) async {
  if (isSubList) {
    jtcsubcategories = null;
  }
  if (jtcsubcategories == null) {
    Response response;
    response = await get(Urls.JTC_URL + slug);
    int statusCode = response.statusCode;
    final body = json.decode(response.body);
    if (statusCode == 200) {
      jtcsubcategories =
          (body as List).map((i) => JTCSubCategoryModel.fromJson(i)).toList();

      return jtcsubcategories;
    } else {
      return jtcsubcategories = List();
    }
  } else {
    return jtcsubcategories;
  }
}

// https://api.evaly.com.bd/core/public/categories/?parent=bags-luggage-966bc8aac     sub cate by slug
