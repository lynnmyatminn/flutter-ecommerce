class JTCCategoryModel {
  int id;
  String name;
  bool status;

  JTCCategoryModel({this.id, this.name, this.status});

  JTCCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['CategoryID'];
    name = json['CategoryName'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryID'] = this.id;
    data['CategoryName'] = this.name;
    data['Status'] = this.status;
    return data;
  }
}
