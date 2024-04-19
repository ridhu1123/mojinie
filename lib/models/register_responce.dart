class RegisterResponce {
  bool? status;
  String? message;
  Data? data;
  int? id;

  RegisterResponce({this.status, this.message, this.data, this.id});

  RegisterResponce.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Data {
  String? fname;
  String? lname;
  String? email;
  String? mobile;
  String? gender;
  String? password;

  Data(
      {this.fname,
      this.lname,
      this.email,
      this.mobile,
      this.gender,
      this.password});

  Data.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['password'] = this.password;
    return data;
  }
}
