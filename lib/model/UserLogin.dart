class UserLogin {
  int? id;
  String? name;
  String? email;
  String? token;

  UserLogin({
    this.id,
    this.name,
    this.email,
    this.token,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json){
    return UserLogin(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }
}