class comment {
  final int id;
  final int user_id;
  final int cafe_id;
  final String content;


  const comment({
    required this.id,
    required this.user_id,
    required this.cafe_id,
    required this.content,
  });

  factory comment.fromJson(Map<String, dynamic> json){
    return comment(
      id: json['id'],
      user_id: json['user_id'],
      cafe_id: json['cafe_id'],
      content: json['content'],
    );
  }
}