class listBookmark {
  final int id;
  final int cafe_id;
  final int user_id;

  const listBookmark({
    required this.id,
    required this.cafe_id,
    required this.user_id,
  });

  factory listBookmark.fromJson(Map<String, dynamic> json){
    return listBookmark(
        id: json['id'],
        cafe_id: json['cafe_id'],
        user_id: json['user_id'],
    );
  }
}