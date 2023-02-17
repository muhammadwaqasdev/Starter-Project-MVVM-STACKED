class UserModel {
  String? name;
  String? email;
  String? userId;
  String? phone;

  UserModel({this.name, this.email, this.userId, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    email = json['Email'];
    userId = json['UserId'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['UserId'] = this.userId;
    data['Phone'] = this.phone;
    return data;
  }
}