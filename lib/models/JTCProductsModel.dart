class JTCProductsModels {
  String count;
  String next;
  Null previous;
  List<Results> results;

  JTCProductsModels({this.count, this.next, this.previous, this.results});

  JTCProductsModels.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  // String gemid;
  String gemcode;
  String prefix;
  // String storeid;
  String storename;
  String gemtitle;
  String description;
  String productImage;
  // String sellingPrice;

  Results({
    // this.gemid,
    this.gemcode,
    this.prefix,
    // this.storeid,
    this.storename,
    this.gemtitle,
    this.description,
    this.productImage,
    // this.sellingPrice
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      // gemid:
      // json["Gem_ID"] is int ? json["Gem_ID"] as String : json["Gem_ID"],
      gemcode: json["GemCode"],
      prefix: json["Prefix"],
      // storeid: json["Store_ID"] is int
      //     ? json['Store_ID'] as String
      //     : json['Store_ID'],
      storename: json["StoreName"],
      gemtitle: json["GemTitle"],
      description: json["Description"],
      productImage: json["ProductImage"],
      // sellingPrice: json["SellingPrice"] is double
      //     ? json['SellingPrice'] as String
      //     : json['SellingPrice']
    );
  }

  // Results.fromJson(Map<String, dynamic> json) {
  //   gemid = json['Gem_ID'];
  //   gemcode = json['GemCode'];
  //   prefix = json['Prefix'];
  //   //storeid = json['Store_ID'];
  //   storename = json['StoreName'];
  //   gemtitle = json['GemTitle'];
  //   description = json['Description'];
  //   productImage = json['ProductImage'];
  //   sellingPrice = json['SellingPrice'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['Gem_ID'] = this.gemid;
    data['GemCode'] = this.gemcode;
    data['Prefix'] = this.prefix;
    // data['Store_ID'] = this.storeid;
    data['StoreName'] = this.storename;
    data['GemTitle'] = this.gemtitle;
    data['Description'] = this.description;
    data['ProductImage'] = this.productImage;
    // data['SellingPrice'] = this.sellingPrice;
    return data;
  }
}
