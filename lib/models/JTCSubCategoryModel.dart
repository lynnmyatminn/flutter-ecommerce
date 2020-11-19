class JTCSubCategoryModel {
  int id;
  int subid;
  String name;
  bool status;

  JTCSubCategoryModel({this.id, this.subid, this.name, this.status});

  JTCSubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['CategoryID'];
    subid = json['SubCategoryID'];
    name = json['SubCategoryName'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryID'] = this.id;
    data['SubCategoryID'] = this.subid;
    data['SubCategoryName'] = this.name;
    data['Status'] = this.status;
    return data;
  }
}
