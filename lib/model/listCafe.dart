class listCafe {
  final int id;
  final String title;
  final String description;
  final String image;
  final double rating;

  const listCafe({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory listCafe.fromJson(Map<String, dynamic> json){
    return listCafe(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        rating: json['rating_star'],
    );
  }
}