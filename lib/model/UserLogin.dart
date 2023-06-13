class UserLogin {
  final int id;
  final String name;
  final String email;

  const UserLogin({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json){
    return UserLogin(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}