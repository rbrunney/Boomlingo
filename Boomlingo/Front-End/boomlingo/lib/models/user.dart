class User {
  String? username;
  String? password;
  String? email;
  String? firstname;
  String? lasname;
  String? dOB;
  String? joindate;

  User(
      {this.username,
      this.password,
      this.email,
      this.firstname,
      this.lasname,
      this.dOB,
      this.joindate});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    firstname = json['firstname'];
    lasname = json['lasname'];
    dOB = json['DOB'];
    joindate = json['joindate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lasname'] = this.lasname;
    data['DOB'] = this.dOB;
    data['joindate'] = this.joindate;
    return data;
  }
}